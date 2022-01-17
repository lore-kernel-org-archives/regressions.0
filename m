Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2052C80
	for <regressions@lists.linux.dev>; Mon, 17 Jan 2022 04:06:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id CB24B3201FB7;
	Sun, 16 Jan 2022 23:06:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 16 Jan 2022 23:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turner.link; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	fm1; bh=n0DFGsHNWExIi6aj6YHL87ipkAv0IlrZRJSC1yLUpNc=; b=Kz38+/62
	8tB9VJS4eIF9vcYKkQH59QjGHIXqNwjreEYXdCGdWQ7MpdzM8epbyG0CAVGcav+q
	Y7rshUEXKl50ef8SLGVNq69JhKo+cH57jVks4EYq7dHAiwYrdiVit++WAwzPIz98
	9wrRYXJ2q+DLkAh3uUkdC4CA7I6oQIJwe0NBei4ZfzaD8DufpXJ5Vh/Mq8J6vHQc
	Rnnant4nfdP6KY8w6Jlzt0t1V/i1l37sy2klVtpIaNiupsyxk49cdDckZK3sLktO
	xZ+UPCxWbYRCfhOJ7FxFJ0SJnwQg9nuuxbb9Ow95DmdhrYt1Vdk9UiHLsRwmE4pU
	mXiPsazCG1avGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=n0DFGsHNWExIi6aj6YHL87ipkAv0I
	lrZRJSC1yLUpNc=; b=Bx9GDCl9FqPbzScBcfsIBzUZlIGLMu7Aojor5W7M7mXYm
	7itdZjFp+xQOfpPrXfb5GMA3gtCOrzgS1DVylKjNb5moMIKav/whwS4Rgq4obA5W
	oE0V0UOuhrONeT5m9eZkxI4Y4Oyt+lonmi7+LYcoN0mAQQGLB4o8QkbqJ+rHBqHZ
	QjLm4rQfEHlPY3okwlsnkllbLu434+JI8pgY2SCbSCd+fz2tt1zy5tAlxYKDUMLv
	8jhjzbZqzv9kAR7BBjUzCLvn86sZpQsIOwvuK8zGaZkvRwgm+kfzE1ROU0kQl7t0
	XlhwBr0M3/0J6jlGwleDnn/fXWbMCoithA1RjQWjw==
X-ME-Sender: <xms:RuvkYQcsL7PUn7wiICMNIzHQmtqzMGPTmT5nBG9dc6ssY5w4mdyXOw>
    <xme:RuvkYSMlDp0um5b1Qmm_oIc0IkGwJO4fkXeNSG8Ru6RW5Z72dc9XsEUcx6TBanqDE
    5ZkR7I6oEDm69UnbA>
X-ME-Received: <xmr:RuvkYRiaByLc_VtdAC2ssjekYv2zxIAjhf9YzwtN7qZHj9rEl-OzpkvDNRaz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkgggtsehttdertddttddtnecuhfhrohhmpeflrghmvghsucffrdcu
    vfhurhhnvghruceolhhinhhugihkvghrnhgvlhdrfhhoshhssegumhgrrhgtqdhnohhnvg
    drthhurhhnvghrrdhlihhnkheqnecuggftrfgrthhtvghrnhepfeetgfefueduffeludeu
    keekjedvfeeiffegudfgudetkeeghfegteelfffhgeeunecuffhomhgrihhnpedugedqrh
    gtuddrihhmpdhkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdgrrhgthhhlihhn
    uhigrdhorhhgpdguvghvihgtvghsrdhmhienucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehlihhnuhigkhgvrhhnvghlrdhfohhsshesughmrghr
    tgdqnhhonhgvrdhtuhhrnhgvrhdrlhhinhhk
X-ME-Proxy: <xmx:RuvkYV-YsXRQQ_nR3LCk5OJSY5rM4A775o0bV4e5ivrYZyeghm19HA>
    <xmx:RuvkYcv-WlQZJNz0GXJwjVx0SwpJhsdY2X05OLsgtiHkHJxdH9FK7g>
    <xmx:RuvkYcF6sxmeE4CoCdVtbAaPYy6pobtkNIAI_1CqeACtk7YZZ5_-mA>
    <xmx:RuvkYWXLKrii69_qCnsruCC5cssP876oFC5jmOzlNKzM7CQk-Urg8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jan 2022 23:06:29 -0500 (EST)
From: James D. Turner <linuxkernel.foss@dmarc-none.turner.link>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [REGRESSION] Too-low frequency limit for AMD GPU PCI-passed-through
 to Windows VM
Date: Sun, 16 Jan 2022 21:12:21 -0500
Message-ID: <87ee57c8fu.fsf@turner.link>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

With newer kernels, starting with the v5.14 series, when using a MS
Windows 10 guest VM with PCI passthrough of an AMD Radeon Pro WX 3200
discrete GPU, the passed-through GPU will not run above 501 MHz, even
when it is under 100% load and well below the temperature limit. As a
result, GPU-intensive software (such as video games) runs unusably
slowly in the VM.

In contrast, with older kernels, the passed-through GPU runs at up to
1295 MHz (the correct hardware limit), so GPU-intensive software runs at
a reasonable speed in the VM.

I've confirmed that the issue exists with the following kernel versions:

- v5.16
- v5.14
- v5.14-rc1

The issue does not exist with the following kernels:

- v5.13
- various packaged (non-vanilla) 5.10.* Arch Linux `linux-lts` kernels

So, the issue was introduced between v5.13 and v5.14-rc1. I'm willing to
bisect the commit history to narrow it down further, if that would be
helpful.

The configuration details and test results are provided below. In
summary, for the kernels with this issue, the GPU core stays at a
constant 0.8 V, the GPU core clock ranges from 214 MHz to 501 MHz, and
the GPU memory stays at a constant 625 MHz, in the VM. For the correctly
working kernels, the GPU core ranges from 0.85 V to 1.0 V, the GPU core
clock ranges from 214 MHz to 1295 MHz, and the GPU memory stays at 1500
MHz, in the VM.

Please let me know if additional information would be helpful.

Regards,
James Turner

# Configuration Details

Hardware:

- Dell Precision 7540 laptop
- CPU: Intel Core i7-9750H (x86-64)
- Discrete GPU: AMD Radeon Pro WX 3200
- The internal display is connected to the integrated GPU, and external
  displays are connected to the discrete GPU.

Software:

- KVM host: Arch Linux
  - self-built vanilla kernel (built using Arch Linux `PKGBUILD`
    modified to use vanilla kernel sources from git.kernel.org)
  - libvirt 1:7.10.0-2
  - qemu 6.2.0-2

- KVM guest: Windows 10
  - GPU driver: Radeon Pro Software Version 21.Q3 (Note that I also
    experienced this issue with the 20.Q4 driver, using packaged
    (non-vanilla) Arch Linux kernels on the host, before updating to the
    21.Q3 driver.)

Kernel config:

- For v5.13, v5.14-rc1, and v5.14, I used
  https://github.com/archlinux/svntogit-packages/blob/89c24952adbfa645d9e1a6f12c572929f7e4e3c7/trunk/config
  (The build script ran `make olddefconfig` on that config file.)

- For v5.16, I used
  https://github.com/archlinux/svntogit-packages/blob/94f84e1ad8a530e54aa34cadbaa76e8dcc439d10/trunk/config
  (The build script ran `make olddefconfig` on that config file.)

I set up the VM with PCI passthrough according to the instructions at
https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF

I'm passing through the following PCI devices to the VM, as listed by
`lspci -D -nn`:

  0000:01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Lexa XT [Radeon PRO WX 3200] [1002:6981]
  0000:01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X] [1002:aae0]

The host kernel command line includes the following relevant options:

  intel_iommu=on vfio-pci.ids=1002:6981,1002:aae0

to enable IOMMU and bind the `vfio-pci` driver to the PCI devices.

My `/etc/mkinitcpio.conf` includes the following line:

  MODULES=(vfio_pci vfio vfio_iommu_type1 vfio_virqfd i915 amdgpu)

to load `vfio-pci` before the graphics drivers. (Note that removing
`i915 amdgpu` has no effect on this issue.)

I'm using libvirt to manage the VM. The relevant portions of the XML
file are:

  <hostdev mode="subsystem" type="pci" managed="yes">
    <source>
      <address domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
    </source>
    <address type="pci" domain="0x0000" bus="0x06" slot="0x00" function="0x0"/>
  </hostdev>
  <hostdev mode="subsystem" type="pci" managed="yes">
    <source>
      <address domain="0x0000" bus="0x01" slot="0x00" function="0x1"/>
    </source>
    <address type="pci" domain="0x0000" bus="0x07" slot="0x00" function="0x0"/>
  </hostdev>

# Test Results

For testing, I used the following procedure:

1. Boot the host machine and log in.

2. Run the following commands to gather information. For all the tests,
   the output was identical.

   - `cat /proc/sys/kernel/tainted` printed:

     0

   - `hostnamectl | grep "Operating System"` printed:

     Operating System: Arch Linux

   - `lspci -nnk -d 1002:6981` printed

     01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Lexa XT [Radeon PRO WX 3200] [1002:6981]
     	Subsystem: Dell Device [1028:0926]
     	Kernel driver in use: vfio-pci
     	Kernel modules: amdgpu

   - `lspci -nnk -d 1002:aae0` printed

     01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X] [1002:aae0]
     	Subsystem: Dell Device [1028:0926]
     	Kernel driver in use: vfio-pci
     	Kernel modules: snd_hda_intel

   - `sudo dmesg | grep -i vfio` printed the kernel command line and the
     following messages:

     VFIO - User Level meta-driver version: 0.3
     vfio-pci 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=none
     vfio_pci: add [1002:6981[ffffffff:ffffffff]] class 0x000000/00000000
     vfio_pci: add [1002:aae0[ffffffff:ffffffff]] class 0x000000/00000000
     vfio-pci 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=none

3. Start the Windows VM using libvirt and log in. Record sensor
   information.

4. Run a graphically-intensive video game to put the GPU under load.
   Record sensor information.

5. Stop the game. Record sensor information.

6. Shut down the VM. Save the output of `sudo dmesg`.

I compared the `sudo dmesg` output for v5.13 and v5.14-rc1 and didn't
see any relevant differences.

Note that the issue occurs only within the guest VM. When I'm not using
a VM (after removing `vfio-pci.ids=1002:6981,1002:aae0` from the kernel
command line so that the PCI devices are bound to their normal `amdgpu`
and `snd_hda_intel` drivers instead of the `vfio-pci` driver), the GPU
operates correctly on the host.

## Linux v5.16 (issue present)

$ cat /proc/version
Linux version 5.16.0-1 (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Sun, 16 Jan 2022 01:51:08 +0000

Before running the game:

- GPU core: 214.0 MHz, 0.800 V, 0.0% load, 53.0 degC
- GPU memory: 625.0 MHz

While running the game:

- GPU core: 501.0 MHz, 0.800 V, 100.0% load, 54.0 degC
- GPU memory: 625.0 MHz

After stopping the game:

- GPU core: 214.0 MHz, 0.800 V, 0.0% load, 51.0 degC
- GPU memory: 625.0 MHz

## Linux v5.14 (issue present)

$ cat /proc/version
Linux version 5.14.0-1 (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Sun, 16 Jan 2022 03:19:35 +0000

Before running the game:

- GPU core: 214.0 MHz, 0.800 V, 0.0% load, 50.0 degC
- GPU memory: 625.0 MHz

While running the game:

- GPU core: 501.0 MHz, 0.800 V, 100.0% load, 54.0 degC
- GPU memory: 625.0 MHz

After stopping the game:

- GPU core: 214.0 MHz, 0.800 V, 0.0% load, 49.0 degC
- GPU memory: 625.0 MHz

## Linux v5.14-rc1 (issue present)

$ cat /proc/version
Linux version 5.14.0-rc1-1 (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Sun, 16 Jan 2022 18:31:35 +0000

Before running the game:

- GPU core: 214.0 MHz, 0.800 V, 0.0% load, 50.0 degC
- GPU memory: 625.0 MHz

While running the game:

- GPU core: 501.0 MHz, 0.800 V, 100.0% load, 54.0 degC
- GPU memory: 625.0 MHz

After stopping the game:

- GPU core: 214.0 MHz, 0.800 V, 0.0% load, 49.0 degC
- GPU memory: 625.0 MHz

## Linux v5.13 (works correctly, issue not present)

$ cat /proc/version
Linux version 5.13.0-1 (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Sun, 16 Jan 2022 02:39:18 +0000

Before running the game:

- GPU core: 214.0 MHz, 0.850 V, 0.0% load, 55.0 degC
- GPU memory: 1500.0 MHz

While running the game:

- GPU core: 1295.0 MHz, 1.000 V, 100.0% load, 67.0 degC
- GPU memory: 1500.0 MHz

After stopping the game:

- GPU core: 214.0 MHz, 0.850 V, 0.0% load, 52.0 degC
- GPU memory: 1500.0 MHz
