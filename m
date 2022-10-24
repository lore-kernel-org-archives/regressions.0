Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A994687
	for <regressions@lists.linux.dev>; Mon, 24 Oct 2022 18:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666636760; x=1698172760;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GUDQBlNjHMdPsIfYPjRgEOsvxg6HJur/uQJk0rXPxEU=;
  b=fWWKCPdUIZDRoNyMO71B3dtCGb/FuwaW3nB5wW/DkZRe338a7Nk5Pex2
   QSPu9RJ0pwfb2f0DMKoTvN5F+aOaFFIvooslO3WWTjsL9mb34UmmGM65l
   6RcUyc1Eeq+F1CnpSmk6qSgf0Ix9o+JwB9V/XNEUuiGrx3cO5loatWpfY
   /1d6/LT9IL4LncsrpUA/qH89mM/heqHzHW1//64IfQhXHOtRedkL6/IV7
   iOEfwGBEskaFMJIMxkz1mw7LtU2FhZVthJHy6fc3Icq2AM7vVAsQcXclq
   XZpmIBUp/fWZ8Goce8QyD6h+bjXPHhwcSxFd5fVMxjEx+L/EPkuYiJblJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="307486463"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="307486463"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 11:39:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="631360266"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="631360266"
Received: from hossain3-mobl.amr.corp.intel.com (HELO spandruv-desk1.amr.corp.intel.com) ([10.209.39.87])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 11:39:14 -0700
Message-ID: <e5d3d561bb3a9c68bc903cfc35c27629a4a9225c.camel@linux.intel.com>
Subject: Re: BUG: bisected: thermald regression (MEMLEAK) in commit
 c7ff29763989bd09c433f73fae3c1e1c15d9cda4
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>, LKML
	 <linux-kernel@vger.kernel.org>, rjw@rjwysocki.net
Cc: regressions@lists.linux.dev, regressions@leemhuis.info, 
	"linux-acpi@vger.kernel.org"
	 <linux-acpi@vger.kernel.org>, Robert Moore <robert.moore@intel.com>, 
	devel@acpica.org
Date: Mon, 24 Oct 2022 11:39:13 -0700
In-Reply-To: <bd1f0d2a-d456-92cc-ecca-23e480aea4b1@alu.unizg.hr>
References: <e0f06714-5a49-a4e6-24e6-c4103c820819@alu.unizg.hr>
	 <9ef3674afd370050b86a68e44c97e4f0257f1adf.camel@linux.intel.com>
	 <bd1f0d2a-d456-92cc-ecca-23e480aea4b1@alu.unizg.hr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2022-10-24 at 20:34 +0200, Mirsad Goran Todorovac wrote:
> Hi Srinivas,
> 
> On 24. 10. 2022. 17:51, srinivas pandruvada wrote:
> > Hi Mirsad,
> > 
> > Thanks for the bisect.
> > 
> > On Mon, 2022-10-24 at 15:13 +0200, Mirsad Goran Todorovac wrote:
> > > Dear all,
> > > 
> > > Around Sep 27th 2022 I've noticed in a mainline kernel built with
> > > CONFIG_DEBUG_KMEMLEAK=y
> > > that there actually is a leak:
> > > 
> > > > sudo cat /sys/kernel/debug/kmemleak unreferenced object
> > > 0xffff8881095f3ee0 (size 80): comm "thermald", pid 837, jiffies
> > > 4294896698 (age 9867.428s) hex dump (first 32 bytes): 00 00 00 00
> > > 00
> > > 00
> > > 00 00 0d 01 2d 00 00 00 00 00 ..........-..... af 07 01 00 00 c9
> > > ff
> > > ff
> > > 00 00 00 00 00 00 00 00 ................ backtrace:
> > > [<00000000b50b9dd6>]
> > > kmem_cache_alloc+0x184/0x380 [<00000000fa8428c0>]
> > > acpi_os_acquire_object+0x2c/0x32 [<000000002cc0099f>]
> > > acpi_ps_alloc_op+0x65/0xe6 [<00000000335faf1b>]
> > > acpi_ps_get_next_arg+0x842/0x9ed [<000000007afa2dee>]
> > > acpi_ps_parse_loop+0x718/0xee1 [<0000000010ce490e>]
> > > acpi_ps_parse_aml+0x261/0x7b2 [<00000000278d4c5f>]
> > > acpi_ps_execute_method+0x360/0x459 [<00000000ff7ad4ba>]
> > > acpi_ns_evaluate+0x595/0x810 [<0000000037ce3488>]
> > > acpi_evaluate_object+0x28b/0x5b2 [<000000001a800bbf>]
> > > acpi_run_osc+0x209/0x3d0 [<00000000776fbd43>]
> > > int3400_thermal_run_osc+0xed/0x180 [int3400_thermal]
> > > [<00000000d6ec2302>] current_uuid_store+0x17c/0x1d0
> > > [int3400_thermal]
> > > [<00000000486cf3e6>] dev_attr_store+0x3e/0x60
> > > [<00000000bf193027>]
> > > sysfs_kf_write+0x88/0xa0 [<00000000820b5cce>]
> > > kernfs_fop_write_iter+0x1c9/0x270 [<0000000062f8d35e>]
> > > vfs_write+0x5a5/0x750 Mr. Pandruvada required a bug bisect from
> > > me,
> > > so I
> > > have eventually made one. # first bad commit:
> > > [c7ff29763989bd09c433f73fae3c1e1c15d9cda4] thermal: int340x:
> > > Update
> > > OS
> > This will say this patch as this patch is calling acpi_run_osc in
> > response to thermald calls for the first time.
> > 
> > But looking at code, this is freeing the memory allocated by
> > acpi_run_osc() call chain as any other caller.
> > 
> >         status = acpi_run_osc(handle, &context);
> >         if (ACPI_SUCCESS(status)) {
> >                 ret = *((u32 *)(context.ret.pointer + 4));
> >                 if (ret != *enable)
> >                         result = -EPERM;
> > 
> >                 kfree(context.ret.pointer);
> >         } else
> >                 result = -EPERM;
> > 
> > There is no kfree when call failed as at other places.
> > I think you are failing, you can search for "_OSC" in dmesg.
> > On some Dell systems this OSC setting fails because of some BIOS
> > issue.
> > May be you are hitting that case.
> > Just for the sake of test, please apply the diff and see if the
> > issue
> > is gone.
> 
> Thank you for the patch. Unfortunately, when applied to v6.0.3 it
> didn't 
> fix the issue.
Thanks for the test. I copied to acpi and acpica mailing list. Someone
can tell us what is this call doing wrong here.

Thanks,
Srinivas

> 
> marvin@marvin-IdeaPad-3-15ITL6:~$ uname -rms
> Linux 6.0.3-18-fix01-mlk+ x86_64
> marvin@marvin-IdeaPad-3-15ITL6:~$ sudo bash
> [sudo] password for marvin:
> root@marvin-IdeaPad-3-15ITL6:/home/marvin# cat
> /sys/kernel/debug/kmemleak
> root@marvin-IdeaPad-3-15ITL6:/home/marvin# echo scan > 
> /sys/kernel/debug/kmemleak
> root@marvin-IdeaPad-3-15ITL6:/home/marvin# cat
> /sys/kernel/debug/kmemleak
> unreferenced object 0xffff998b030c3370 (size 80):
>    comm "thermald", pid 824, jiffies 4294893654 (age 67.080s)
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 0d 01 2d 00 00 00 00 00 ..........-.....
>      af 07 01 c0 6f bc ff ff 00 00 00 00 00 00 00 00 ....o...........
>    backtrace:
>      [<00000000490225c2>] slab_post_alloc_hook+0x80/0x2e0
>      [<00000000dc142b33>] kmem_cache_alloc+0x166/0x2e0
>      [<00000000168f1071>] acpi_os_acquire_object+0x2c/0x32
>      [<00000000fcc615e1>] acpi_ps_alloc_op+0x4a/0x99
>      [<00000000fb475bb4>] acpi_ps_get_next_arg+0x611/0x761
>      [<000000009048d529>] acpi_ps_parse_loop+0x494/0x8d7
>      [<000000005b0bf086>] acpi_ps_parse_aml+0x1bb/0x561
>      [<000000007ab7e288>] acpi_ps_execute_method+0x20f/0x2d5
>      [<00000000c12fa6b7>] acpi_ns_evaluate+0x34d/0x4f3
>      [<000000001be94719>] acpi_evaluate_object+0x180/0x3ae
>      [<00000000423a7ad5>] acpi_run_osc+0x128/0x250
>      [<0000000040a72af8>] int3400_thermal_run_osc+0x6f/0xc0 
> [int3400_thermal]
>      [<00000000f8d59987>] current_uuid_store+0xe3/0x120
> [int3400_thermal]
>      [<000000007e2e2d17>] dev_attr_store+0x14/0x30
>      [<00000000b824b589>] sysfs_kf_write+0x38/0x50
>      [<00000000beae69c1>] kernfs_fop_write_iter+0x146/0x1d0
> root@marvin-IdeaPad-3-15ITL6:/home/marvin#
> 
> The build process was as follows:
> 
>   1573  10/24/2022 06:41:53 PM  cd linux_stable
>   1574  10/24/2022 06:42:03 PM  git checkout v6.0.3
>   1575  10/24/2022 06:42:44 PM  cd ..
>   1576  10/24/2022 06:42:50 PM  time rm -rf linux_stable_build; time
> cp 
> -rp linux_stable linux_stable_build; \
>                      time diff -ur linux_stable linux_stable_build;
> cd 
> linux_stable_build
>   1577  10/24/2022 06:46:19 PM  git apply ../thermald-20221024-
> 01.diff
>   1578  10/24/2022 06:46:28 PM  vi ../config-5.15.0-50-memleak
>   1579  10/24/2022 06:47:08 PM  cp ../config-5.15.0-50-memleak
> .config
>   1580  10/24/2022 06:47:16 PM  make olddefconfig
>   1581  10/24/2022 06:48:42 PM  time nice make CC="ccache gcc" 
> KBUILD_BUILD_TIMESTAMP="" -j10 deb-pkg; date
> 
> I think your patch definitively makes sense, but there's more to this
> than meets the eye :-/
> 
> Hope this helps.
> 
> Thanks
> Mirsad
> 
> --
> Mirsad Goran Todorovac
> Sistem inženjer
> Grafički fakultet | Akademija likovnih umjetnosti
> Sveučilište u Zagrebu

