program tubesku;
uses crt;
TYPE
	pemesan = record
	id : integer;
	nama : string;
	umur : integer;
	alamat : string;  
	saldo : real;
	poin : integer;
end;
var
	pilihan,x,n,i  : integer;
	user : pemesan;
	anggota : array[1..10] of pemesan;

	procedure dataAnggota(var data : pemesan); 
	var
		i: Integer;
	begin
		gotoxy(1,1);write('Jumlah data yang ingin di input: ');
		readln(n);
		for i:= 1 to n do
		begin
			anggota[i].id := i;
			//gotoxy(1,2);
			writeln('ID: ',anggota[i].id);
			//gotoxy(1,3);
			write('Masukkan nama: ');
			readln(anggota[i].nama);
			//gotoxy(1,4);
			write('Masukkan umur: ');
			readln(anggota[i].umur);
			//gotoxy(1,5);
			write('Masukkan alamat: ');
			readln(anggota[i].alamat);
			//gotoxy(1,6);
			write('Masukkan saldo: ');
			readln(anggota[i].saldo);
			anggota[i].poin:= 0;
		end;
	end;

	procedure sortNama(var data : pemesan;n : integer);
	var
		i,j: Integer;
		tempnama : string;
		tempid,tempumur : integer;
		tempalamat : string;  
		tempsaldo : real;
		temppoin : integer;
	begin
		for i := n downto 2 do
		begin
				for j := 1 to i-1 do
				if anggota[j].nama < anggota[j+1].nama then
				begin
						//MENSORTING NAMA
						tempnama := anggota[j+1].nama;
						anggota[j+1].nama := anggota[j].nama;
						anggota[j].nama := tempnama;

						//MENSORTING ID
						tempid := anggota[j+1].id;
						anggota[j+1].id := anggota[j].id;
						anggota[j].id := tempid;

						//MENSORTING ALAMAT
						tempalamat := anggota[j+1].alamat;
						anggota[j+1].alamat := anggota[j].alamat;
						anggota[j].alamat := tempalamat;

						//MENSORTING UMUR
						tempumur := anggota[j+1].umur;
						anggota[j+1].umur := anggota[j].umur;
						anggota[j].umur := tempumur;

						//MENSORTING SALDO
						tempsaldo := anggota[j+1].saldo;
						anggota[j+1].saldo := anggota[j].saldo;
						anggota[j].saldo := tempsaldo;

						//MENSORTING POIN
						temppoin := anggota[j+1].poin;
						anggota[j+1].poin := anggota[j].poin;
						anggota[j].poin := temppoin;
				end;
		end;
	end;
	procedure saldo50k(var data : pemesan;var n:integer);
	var
		i: Integer;
		a : integer;
		minimal : real;
		begin
			minimal := 50000;
			textcolor(3);
			gotoxy(1,1);writeln(' ====================DATA ANGGOTA SALDO>50 RIBU====================');
			textcolor(14);
			gotoxy(1,2);writeln(' ------------------------------------------------------------------');
			gotoxy(1,4);writeln(' ------------------------------------------------------------------');
			gotoxy(1,3);write(' |  ID');
			gotoxy(8,3);write(' |      Nama');
			gotoxy(25,3);write(' | Umur');
			gotoxy(33,3);write(' |    Alamat');
			gotoxy(48,3);write(' |   Saldo');
			gotoxy(60,3);writeln(' | Poin');
			gotoxy(67,3);writeln(' |');
			textcolor(15);
			writeln;
			for i:=1 to N do
			begin
				if (anggota[i].saldo >= minimal) then
					begin
					a:=5;
					sortNama(user,n);
						gotoxy(1,a);write(' |',anggota[i].id);
						gotoxy(8,a);write(' |',anggota[i].nama);
						gotoxy(25,a);write(' |',anggota[i].umur);
						gotoxy(33,a);write(' |',anggota[i].alamat);
						gotoxy(48,a);write(' |',anggota[i].saldo:0:0);
						gotoxy(60,a);writeln(' |',anggota[i].poin);
						gotoxy(67,a);writeln(' |');
						a:=a+1;
					end;
			end;
			writeln(' ------------------------------------------------------------------');
		end;
	procedure rentalmobil(var data : pemesan);
	var
		i: Integer;
		tujuan : string;
		harga : real;
		pilihan : string;
		mobil : integer;
	begin
		gotoxy(1,1);write('ID Pemesan: ');
		readln(i);
		textcolor(14);
		writeln('====DATA PEMESAN====');
		textcolor(15);
		writeln('ID: ',anggota[i].id);
		writeln('Nama: ',anggota[i].nama);
		writeln('Umur: ',anggota[i].umur);
		writeln('Alamat: ',anggota[i].alamat);
		writeln('Saldo: Rp ',anggota[i].saldo:0:0);
		writeln('Poin: ', anggota[i].poin);
		writeln;
		write('Tujuan Kota (A/B): ');
		readln(tujuan);
		case tujuan of
		'A'  : begin
				writeln('Jarak ke kota ',tujuan,' = 50 km');
				textcolor(14);
				writeln('Mobil yang tersedia:');
				textcolor(15);
				writeln('1. Inova = Rp 8000/km');
				writeln('2. Avanza = Rp 5000/km');
				writeln('3. Alya = Rp 4000/km');
				writeln;
				write('Mobil yang ingin digunakan: ');
				readln(mobil);
				case mobil of
					1 : begin
							harga := 8000 * 50;
							writeln('Total harga: Rp ',harga:0:0);
							if (harga<=anggota[i].saldo) then
							begin
								textcolor(10);
								writeln('Saldo anda mencukupi dan mobil dapat dipinjam');
								textcolor(15);
								write('Apakah anda yakin ingin memesan? (OK/CANCEL):');
								readln(pilihan);
								case pilihan of
									'OK' : begin
										anggota[i].saldo:= anggota[i].saldo-harga;
										write('Sisa saldo anda: Rp ');
										textcolor(9);
										writeln(anggota[i].saldo:0:0);
										textcolor(15);
										anggota[i].poin:= anggota[i].poin+10;
										writeln('Poin anda: ', anggota[i].poin);
										end;
									'CANCEL' : writeln('Pesanan anda telah dibatalkan');	
								end;
							end//END IF
							else
								begin
									textcolor(12);
									writeln('Saldo anda tidak mencukupi');
									textcolor(15);
								end;
					end; //END NO 1
					2 : begin
							harga := 5000 * 50;
							writeln('Total harga: Rp',harga:0:0);
							if (harga<=anggota[i].saldo) then
							begin
								textcolor(10);
								writeln('Saldo anda mencukupi dan mobil dapat dipinjam');
								textcolor(15);
								write('Apakah anda yakin ingin memesan? (OK/CANCEL):');
								readln(pilihan);
								case pilihan of
									'OK' : begin
										anggota[i].saldo:= anggota[i].saldo-harga;
										write('Sisa saldo anda: Rp ');
										textcolor(9);
										writeln(anggota[i].saldo:0:0);
										textcolor(15);
										anggota[i].poin:= anggota[i].poin+5;
										writeln('Poin anda: ', anggota[i].poin);
										end;
									'CANCEL' : writeln('Pesanan anda telah dibatalkan');	
								end;
							end//END IF
							else
								begin
									textcolor(12);
									writeln('Saldo anda tidak mencukupi');
									textcolor(15);
								end;
						end; //END NO2
					3 : begin
							harga:= 4000 * 50;
							writeln('Total harga: Rp',harga:0:0);
							if (harga<=anggota[i].saldo) then
							begin
								textcolor(10);
								writeln('Saldo anda mencukupi dan mobil dapat dipinjam');
								textcolor(15);
								write('Apakah anda yakin ingin memesan? (OK/CANCEL):');
								readln(pilihan);
								case pilihan of
									'OK' : begin
										anggota[i].saldo:= anggota[i].saldo-harga;
										write('Sisa saldo anda: Rp ');
										textcolor(9);
										writeln(anggota[i].saldo:0:0);
										textcolor(15);
										end;
									'CANCEL' : writeln('Pesanan anda telah dibatalkan');	
								end;
							end//END IF
							else
								begin
									textcolor(12);
									writeln('Saldo anda tidak mencukupi');
									textcolor(15);
								end;
						end; //END NO 3
				end; // END CASE OF mobil
			end; // END CASE OF 'A'
		'B' : begin
			writeln('Jarak ke kota ',tujuan,' = 80km');
			textcolor(14);
			writeln('Mobil yang tersedia:');
			textcolor(15);
			writeln('1. Mobilio = Rp 5000/km');
			writeln('2. Brio = Rp 4000/km');

			write('Mobil yang ingin digunakan: ');
			readln(mobil);
				case mobil of
					1 : begin
							harga := 5000 * 50;
							writeln('Total harga: Rp',harga:0:0);
							if (harga<=anggota[i].saldo) then
							begin
								textcolor(10);
								writeln('Saldo anda mencukupi dan mobil dapat dipinjam');
								textcolor(15);
								write('Apakah anda yakin ingin memesan? (OK/CANCEL):');
								readln(pilihan);
								case pilihan of
									'OK' : begin
										anggota[i].saldo:= anggota[i].saldo-harga;
										
										write('Sisa saldo anda: Rp ');
										textcolor(9);
										writeln(anggota[i].saldo:0:0);
										textcolor(15);
										end;
									'CANCEL' : writeln('Pesanan anda telah dibatalkan');	
								end;
							end//END IF
							else
								begin
									textcolor(12);
									writeln('Saldo anda tidak mencukupi');
									textcolor(15);
								end;
						end; //END NO 1
					2 : begin
							harga := 4000 * 50;
							writeln('Total harga: Rp',harga:0:0);
							if (harga<=anggota[i].saldo) then
							begin
								textcolor(10);
								writeln('Saldo anda mencukupi dan mobil dapat dipinjam');
								textcolor(15);
								write('Apakah anda yakin ingin memesan? (OK/CANCEL):');
								readln(pilihan);
								case pilihan of
									'OK' : begin
										anggota[i].saldo:= anggota[i].saldo-harga;
										write('Sisa saldo anda: Rp ');
										textcolor(9);
										writeln(anggota[i].saldo:0:0);
										textcolor(15);
										anggota[i].poin:= anggota[i].poin+5;
										writeln('Poin anda: ', anggota[i].poin);
										end;
									'CANCEL' : writeln('Pesanan anda telah dibatalkan');	
								end;
							end//END IF
							else
								begin
									textcolor(12);
									writeln('Saldo anda tidak mencukupi');
									textcolor(15);
								end;
					end; //END NO2
				end; //CASE mobil
			end; //CASE'B'
		end; //END CASE 'tujuan'
	end; //end procedure

BEGIN
	x:=1;
	repeat
		clrscr;
		textcolor(11);
		gotoxy (73,5);writeln('==PROGRAM RENTAL MOBIL==');
		textcolor(15);
		gotoxy (73,6);writeln('1. Input data Anggota');
		gotoxy (73,7);writeln('2. Cari ID & Pesan Mobil'); //Menerima inputan ID
		gotoxy (73,8);writeln('3. List Semua Anggota'); //Diurutkan berdasarkan nama anggota
		gotoxy (73,9);writeln('4. List Anggota (Saldo > Rp50000)');
		gotoxy (73,10);writeln('0. Keluar Program');
		writeln;
		writeln;
		textcolor(6);
		gotoxy (73,13);write('Masukkan angka: ');
		textcolor(15);
		readln(pilihan);

		case pilihan of
			1 : begin
				dataAnggota(user);
				write('Tekan enter untuk melanjutkan..');
				readln;
				end;
			2 : begin
				rentalmobil(user);
				write('Tekan enter untuk melanjutkan..');
				readln;
				end;
			3 : begin
					sortNama(user,n);
					textcolor(3);
					gotoxy(1,1);writeln(' ===========================DATA ANGGOTA===========================');
					textcolor(14);
					gotoxy(1,2);writeln(' ------------------------------------------------------------------');
					gotoxy(1,4);writeln(' ------------------------------------------------------------------');
					gotoxy(1,3);write(' |  ID');
					gotoxy(8,3);write(' |      Nama');
					gotoxy(25,3);write(' | Umur');
					gotoxy(33,3);write(' |    Alamat');
					gotoxy(48,3);write(' |   Saldo');
					gotoxy(60,3);writeln(' | Poin');
					gotoxy(67,3);writeln(' |');
					textcolor(15);
					writeln;
					for i:=1 to n do
					begin
						gotoxy(1,i+4);write(' |',anggota[i].id);
						gotoxy(8,i+4);write(' |',anggota[i].nama);
						gotoxy(25,i+4);write(' |',anggota[i].umur);
						gotoxy(33,i+4);write(' |',anggota[i].alamat);
						gotoxy(48,i+4);write(' |',anggota[i].saldo:0:0);
						gotoxy(60,i+4);writeln(' |',anggota[i].poin);
						gotoxy(67,i+4);writeln(' |');
					end;
						writeln(' ------------------------------------------------------------------');
					write('Tekan enter untuk melanjutkan..');
					readln;
				end;
			4 : begin
					saldo50k(user,n);
					write('Tekan enter untuk melanjutkan..');
					readln;
				end;

			0 : begin
					gotoxy(1,1);writeln('Terima kasih..');
					halt; //MENGHENTIKAN PROGRAM UTAMA
					
				end;	
		end;
	until x=99; 
END.