Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BDB14F6D
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 16:09:14 +0000 (UTC)
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1qb1HC-002bdr-1L;
	Tue, 29 Aug 2023 18:09:10 +0200
Date: Tue, 29 Aug 2023 18:09:10 +0200
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <ZO4YJlhHYjM7MsK4@torres.zugschlus.de>
References: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de>
 <ZO2piz5n1MiKR-3-@debian.me>
 <ZO3sA2GuDbEuQoyj@torres.zugschlus.de>
 <ZO4GeazfcA09SfKw@google.com>
 <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
 <ZO4RzCr/Ugwi70bZ@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZO4RzCr/Ugwi70bZ@google.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Tue, Aug 29, 2023 at 08:42:04AM -0700, Sean Christopherson wrote:
> On Tue, Aug 29, 2023, Marc Haber wrote:
> > On Tue, Aug 29, 2023 at 07:53:45AM -0700, Sean Christopherson wrote:
> > > What is different between the bad host(s) and the good host(s)?  E.g.=
 kernel, QEMU,
> >=20
> > The bad host is an APU ("AMD GX-412TC SOC") with 4 GB of RAM, one of the
> > good hosts is a "Xeon(R) CPU E3-1246 v3" with 32 GB of RAM.
>=20
> I don't expect it to help, but can you try booting the bad host with
> "spec_rstack_overflow=3Doff"?

That is destined to go on the kernel command line of the host, not the
VM, right? I am asking because that host runs a set of VMs that are not
that easy to reboot without impact on other services, I'd rather not do
experiments with that.

The issue can be triggered and worked around by changing the VM only, I
didn't touch the host other than some virsh incantations.

>=20
> > system configuration is from the same ansible playbook, but of
> > course there are differences.
>=20
> Can you capture the QEMU command lines for the good and bad hosts?
> KVM doesn't get directly involved in serial port emulation; if the
> blamed commit in 6.5 is triggering unexpected behavior then QEMU is a
> better starting point than KVM.

the qmu command line of the test VM on the APU host is

[14/4946]mh@prom:~ $ pstree -apl | grep [l]asso
  |-qemu-system-x86,251092 -name guest=3Dlasso,debug-threads=3Don -S -objec=
t secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-2=
0-lasso/master-key.aes -machine pc-i440fx-2.1,accel=3Dkvm,usb=3Doff,dump-gu=
est-core=3Doff -cpu Opteron_G3,monitor=3Doff,x2apic=3Don,hypervisor=3Don -m=
 768 -realtime mlock=3Doff -smp 1,sockets=3D1,cores=3D1,threads=3D1 -uuid 1=
5338d79-b877-48da-b72f-f706bd05dadf -no-user-config -nodefaults -chardev so=
cket,id=3Dcharmonitor,fd=3D30,server,nowait -mon chardev=3Dcharmonitor,id=
=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc,driftfix=3Dslew -global kvm-pit.l=
ost_tick_policy=3Ddelay -no-hpet -no-shutdown -global PIIX4_PM.disable_s3=
=3D1 -global PIIX4_PM.disable_s4=3D1 -boot strict=3Don -device ich9-usb-ehc=
i1,id=3Dusb,bus=3Dpci.0,addr=3D0x5.0x7 -device ich9-usb-uhci1,masterbus=3Du=
sb.0,firstport=3D0,bus=3Dpci.0,multifunction=3Don,addr=3D0x5 -device ich9-u=
sb-uhci2,masterbus=3Dusb.0,firstport=3D2,bus=3Dpci.0,addr=3D0x5.0x1 -device=
 ich9-usb-uhci3,masterbus=3Dusb.0,firstport=3D4,bus=3Dpci.0,addr=3D0x5.0x2 =
-device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x6 -drive=
 file=3D/dev/prom/lasso,format=3Draw,if=3Dnone,id=3Ddrive-virtio-disk0,cach=
e=3Dnone,aio=3Dnative -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D=
0x7,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk0,bootindex=3D1,write-cache=
=3Don -drive file=3D/dev/prom/lasso-swap0,format=3Draw,if=3Dnone,id=3Ddrive=
-virtio-disk1,cache=3Dnone,aio=3Dnative -device virtio-blk-pci,scsi=3Doff,b=
us=3Dpci.0,addr=3D0x9,drive=3Ddrive-virtio-disk1,id=3Dvirtio-disk1,write-ca=
che=3Don -drive if=3Dnone,id=3Ddrive-ide0-0-0,readonly=3Don -device ide-cd,=
bus=3Dide.0,unit=3D0,drive=3Ddrive-ide0-0-0,id=3Dide0-0-0 -netdev tap,fd=3D=
33,id=3Dhostnet0,vhost=3Don,vhostfd=3D34 -device virtio-net-pci,netdev=3Dho=
stnet0,id=3Dnet0,mac=3D52:54:00:9e:9a:15,bus=3Dpci.0,addr=3D0x3 -chardev pt=
y,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0,id=3Dserial0 -c=
hardev spicevmc,id=3Dcharchannel0,name=3Dvdagent -device virtserialport,bus=
=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0,id=3Dchannel0,name=3Dcom.=
redhat.spice.0 -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 -spice p=
ort=3D5902,addr=3D127.0.0.1,disable-ticketing,seamless-migration=3Don -devi=
ce qxl-vga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vram64_size=
_mb=3D0,vgamem_mb=3D16,max_outputs=3D1,bus=3Dpci.0,addr=3D0x2 -device intel=
-hda,id=3Dsound0,bus=3Dpci.0,addr=3D0x4 -device hda-duplex,id=3Dsound0-code=
c0,bus=3Dsound0.0,cad=3D0 -chardev spicevmc,id=3Dcharredir0,name=3Dusbredir=
 -device usb-redir,chardev=3Dcharredir0,id=3Dredir0,bus=3Dusb.0,port=3D2 -c=
hardev spicevmc,id=3Dcharredir1,name=3Dusbredir -device usb-redir,chardev=
=3Dcharredir1,id=3Dredir1,bus=3Dusb.0,port=3D3 -chardev spicevmc,id=3Dcharr=
edir2,name=3Dusbredir -device usb-redir,chardev=3Dcharredir2,id=3Dredir2,bu=
s=3Dusb.0,port=3D4 -chardev spicevmc,id=3Dcharredir3,name=3Dusbredir -devic=
e usb-redir,chardev=3Dcharredir3,id=3Dredir3,bus=3Dusb.0,port=3D5 -device v=
irtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x8 -object rng-random,i=
d=3Dobjrng0,filename=3D/dev/urandom -device virtio-rng-pci,rng=3Dobjrng0,id=
=3Drng0,bus=3Dpci.0,addr=3D0xa -sandbox on,obsolete=3Ddeny,elevateprivilege=
s=3Ddeny,spawn=3Ddeny,resourcecontrol=3Ddeny -msg timestamp=3Don
[15/4947]mh@prom:~ $

a refrence qemu command line of a test VM on the Xeon host is

[1/4992]mh@gancho:~ $ pstree -apl | grep '[w]hip'
  |-qemu-system-x86,1478 -enable-kvm -name guest=3Dwhip,debug-threads=3Don =
-S -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu=
/domain-9-whip/master-key.aes -machine pc-i440fx-2.1,accel=3Dkvm,usb=3Doff,=
dump-guest-core=3Doff -cpu Nehalem -m 512 -realtime mlock=3Doff -smp 2,sock=
ets=3D2,cores=3D1,threads=3D1 -uuid 3dd1f71d-3b84-44e2-808f-a5c67694f25c -n=
o-user-config -nodefaults -chardev socket,id=3Dcharmonitor,fd=3D34,server,n=
owait -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dut=
c,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddelay -no-hpet -no-shu=
tdown -global PIIX4_PM.disable_s3=3D1 -global PIIX4_PM.disable_s4=3D1 -boot=
 strict=3Don -device ich9-usb-ehci1,id=3Dusb,bus=3Dpci.0,addr=3D0x5.0x7 -de=
vice ich9-usb-uhci1,masterbus=3Dusb.0,firstport=3D0,bus=3Dpci.0,multifuncti=
on=3Don,addr=3D0x5 -device ich9-usb-uhci2,masterbus=3Dusb.0,firstport=3D2,b=
us=3Dpci.0,addr=3D0x5.0x1 -device ich9-usb-uhci3,masterbus=3Dusb.0,firstpor=
t=3D4,bus=3Dpci.0,addr=3D0x5.0x2 -device virtio-scsi-pci,id=3Dscsi0,bus=3Dp=
ci.0,addr=3D0x7 -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,a=
ddr=3D0x6 -drive file=3D/dev/gancho/whip,format=3Draw,if=3Dnone,id=3Ddrive-=
scsi0-0-0-0,cache=3Dnone,aio=3Dnative -device scsi-hd,bus=3Dscsi0.0,channel=
=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootind=
ex=3D1,write-cache=3Don -netdev tap,fd=3D36,id=3Dhostnet0,vhost=3Don,vhostf=
d=3D37 -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:5e=
:b4:42,bus=3Dpci.0,addr=3D0x3 -chardev pty,id=3Dcharserial0 -device isa-ser=
ial,chardev=3Dcharserial0,id=3Dserial0 -chardev socket,id=3Dcharchannel0,fd=
=3D38,server,nowait -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,ch=
ardev=3Dcharchannel0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 -chardev s=
picevmc,id=3Dcharchannel1,name=3Dvdagent -device virtserialport,bus=3Dvirti=
o-serial0.0,nr=3D2,chardev=3Dcharchannel1,id=3Dchannel1,name=3Dcom.redhat.s=
pice.0 -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 -spice port=3D59=
08,addr=3D127.0.0.1,disable-ticketing,seamless-migration=3Don -device qxl-v=
ga,id=3Dvideo0,ram_size=3D67108864,vram_size=3D67108864,vram64_size_mb=3D0,=
vgamem_mb=3D16,max_outputs=3D1,bus=3Dpci.0,addr=3D0x2 -device intel-hda,id=
=3Dsound0,bus=3Dpci.0,addr=3D0x4 -device hda-duplex,id=3Dsound0-codec0,bus=
=3Dsound0.0,cad=3D0 -chardev spicevmc,id=3Dcharredir0,name=3Dusbredir -devi=
ce usb-redir,chardev=3Dcharredir0,id=3Dredir0,bus=3Dusb.0,port=3D2 -chardev=
 spicevmc,id=3Dcharredir1,name=3Dusbredir -device usb-redir,chardev=3Dcharr=
edir1,id=3Dredir1,bus=3Dusb.0,port=3D3 -device virtio-balloon-pci,id=3Dball=
oon0,bus=3Dpci.0,addr=3D0x8 -object rng-random,id=3Dobjrng0,filename=3D/dev=
/urandom -device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D=
0x9 -sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resou=
rcecontrol=3Ddeny -msg timestamp=3Don
[2/4993]mh@gancho:~ $

Both come from virt-manager, so if the XML helps more, I'll happy to
post that as well.

Greetings
Marc

--=20
---------------------------------------------------------------------------=
--
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
