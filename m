Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131A566C
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 10:14:31 +0000 (UTC)
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1qeC1q-006qTE-1u;
	Thu, 07 Sep 2023 12:14:26 +0200
Date: Thu, 7 Sep 2023 12:14:26 +0200
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Tony Lindgren <tony@atomide.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <ZPmignexOJvJ5J5W@torres.zugschlus.de>
References: <ZO4GeazfcA09SfKw@google.com>
 <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
 <ZO4RzCr/Ugwi70bZ@google.com>
 <ZO4YJlhHYjM7MsK4@torres.zugschlus.de>
 <ZO4nbzkd4tovKpxx@google.com>
 <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
 <ZPEPFJ8QvubbD3H9@google.com>
 <20230901122431.GU11676@atomide.com>
 <ZPiPkSY6NRzfWV5Z@torres.zugschlus.de>
 <20230906152107.GD11676@atomide.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230906152107.GD11676@atomide.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Wed, Sep 06, 2023 at 06:21:07PM +0300, Tony Lindgren wrote:
> * Marc Haber <mh+linux-kernel@zugschlus.de> [230906 14:41]:
> > If I cannot see the host boot, I cannot debug, and if I cannot type into
> > grub, I cannot find out whether removing the serial console from the
> > kernel command line fixes the issue. I have removed the network
> > interface to simplify things, so I need a working console.
> 
> I use something like this for a serial console:
> 
> -serial stdio -append "console=ttyS0 other kernel command line options"

Looks like my problem was that I had "-S" on my qemu command line with
didn't even start the VM after setting it up. Removing the -S makes VNC
and the serial console work.

The most basic reproducer I found is:

/usr/bin/qemu-system-x86_64 \
-m 768 \
-machine pc-i440fx-2.1,accel=kvm,usb=off,dump-guest-core=off \
-nodefaults \
-drive file=/dev/prom/lasso2,format=raw,if=none,id=drive-virtio-disk0,cache=none,discard=unmap,aio=native \
-device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1,write-cache=on \
-serial stdio

Simplifying the drive and device virtio-blk-pci lines prevents the
initramfs of the VM from finding the disk and thus the system doesn't
get as far to show the issue.

If you want to see it work, add
-device qxl-vga,id=video0,ram_size=67108864,vram_size=67108864,vram64_size_mb=0,vgamem_mb=16,max_outputs=1,bus=pci.0,addr=0x2 \
-vnc :1
point a vncviewer to port 5901, remove the "serial=ttyS0" configuration
and see the system run normally.

What else can I do?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
