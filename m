Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF12F36
	for <regressions@lists.linux.dev>; Thu, 17 Mar 2022 13:14:35 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nUpxZ-00035o-MG; Thu, 17 Mar 2022 14:14:33 +0100
Message-ID: <254dc1fb-cda7-6249-35e5-a0c584c41206@leemhuis.info>
Date: Thu, 17 Mar 2022 14:14:32 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug 215605 - [5.14 regression] BUG: unable to handle page fault
 while running badblocks (fsck.ext4 -c) on a raid5 md array
Content-Language: en-US
To: Song Liu <song@kernel.org>, Dominik Mierzejewski <dominik@greysector.net>
Cc: linux-raid <linux-raid@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Jens Axboe <axboe@kernel.dk>
References: <53e7de78-4d27-5089-f159-0d443b354666@leemhuis.info>
 <35bafd68-b340-dfaa-dd5f-d45843104f91@leemhuis.info>
 <CAPhsuW44tX0rBpy5c63HgTtRSF=UAAsgv8ZuYE_QTLhi6syXaA@mail.gmail.com>
 <Yh/nbZYmYD6SpZV9@sakura.greysector.net>
 <CAPhsuW4otwSDcOr8NWFhmecM4AfKim5jQ8aoZO-CY4KkwDFCgg@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAPhsuW4otwSDcOr8NWFhmecM4AfKim5jQ8aoZO-CY4KkwDFCgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647522875;13f774a4;
X-HE-SMSGID: 1nUpxZ-00035o-MG

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Song, two weeks ago you said you would try to reproduce this. Any
success? Or was the discussion moved somewhere else and I just missed it?=


Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

#regzbot poke

On 04.03.22 07:26, Song Liu wrote:
> On Wed, Mar 2, 2022 at 1:54 PM Dominik Mierzejewski
> <dominik@greysector.net> wrote:
>>
>> Hello!
>>
>> On Tuesday, 01 March 2022 at 01:24, Song Liu wrote:
>>> On Mon, Feb 28, 2022 at 1:43 AM Thorsten Leemhuis
>>> <regressions@leemhuis.info> wrote:
>>>>
>>>> [CCing Jens]
>>>>
>>>> Hi, this is your Linux kernel regression tracker. Top-posting for on=
ce,
>>>> to make this easily accessible to everyone.
>>>>
>>>> What's up here? Below regression was reported two weeks ago and I
>>>> forwarded it nearly a week ago, nevertheless the reporter afaics did=
n't
>>>> get a single reply. Is the issue discussed somewhere else and I just=

>>>> missed it? Is the report not accurate for some reason or missing
>>>> something important? Or did the report fall throug the cracks?
>>>
>>> Sorry for the late reply. I was on vacation last week.
>>
>> No problem, thanks for responding.
>>
>> [...]
>>>> On 22.02.22 09:59, Thorsten Leemhuis wrote:
>>>>> Hi, this is your Linux kernel regression tracker.
>>>>>
>>>>> I noticed a regression report in bugzilla.kernel.org that afaics no=
body
>>>>> acted upon since it was reported about a week ago, that's why I dec=
ided
>>>>> to forward it to the lists and add a few relevant people to the CC.=
 To
>>>>> quote from https://bugzilla.kernel.org/show_bug.cgi?id=3D215605
>>>>>
>>>>>>  Dominik Mierzejewski 2022-02-14 10:36:36 UTC
>>>>>>
>>>>>> Created attachment 300450 [details]
>>>>>> kernel-5.16.8 dmesg with crash
>>>>>>
>>>>>> I'm experiencing kernel crash when running badblocks (fsck.ext4 -c=
) on a raid5 md array in my Intel Atom-based NAS box (Thecus N5550):
>>>>>> [  720.911993] kernel: BUG: unable to handle page fault for addres=
s: ffffdbc681023bc8
>>>>>> [  720.912073] kernel: #PF: supervisor read access in kernel mode
>>>>>> [  720.912120] kernel: #PF: error_code(0x0000) - not-present page
>>>>>> [  720.912166] kernel: PGD 11ffc6067 P4D 11ffc6067 PUD 0
>>>>>> [  720.912213] kernel: Oops: 0000 [#1] PREEMPT SMP NOPTI
>>>>>> [  720.912256] kernel: CPU: 1 PID: 1406 Comm: badblocks Not tainte=
d 5.16.8-200.fc35.x86_64 #1
>>>>>> [  720.912321] kernel: Hardware name: Intel Corporation Milstead P=
latform/Granite Well, BIOS CDV W Series 05 08/27/2015
>>>>>> [  720.912400] kernel: RIP: 0010:kfree+0x58/0x3e0
>>>>>> [  720.912449] kernel: Code: 80 4c 01 e5 0f 82 84 03 00 00 48 c7 c=
0 00 00 00 80 48 2b 05 4a 96 3b 01 48 01 c5 48 c1 ed 0c 48 c1 e5 06 48 03=
 2d 28 96 3b 01 <48> 8b 45 08 48 8d 50 ff a8 01 48 0f 45 ea 4
>>>>>> 8 8b 55 08 48 8d 42 ff
>>>>>> [  720.912598] kernel: RSP: 0018:ffff9db4008efaf8 EFLAGS: 00010286=

>>>>>> [  720.912648] kernel: RAX: 00006d7bc0000000 RBX: ffff9284c5214800=
 RCX: ffff9284c3758ff8
>>>>>> [  720.912708] kernel: RDX: ffff9283c1102740 RSI: ffffffffc07af091=
 RDI: ffff9db4008efd58
>>>>>> [  720.912767] kernel: RBP: ffffdbc681023bc0 R08: ffff9db4008efb88=
 R09: ffff9284c3759000
>>>>>> [  720.912826] kernel: R10: 0000000000000028 R11: ffff9284c213db48=
 R12: ffff9db4008efd58
>>>>>> [  720.912885] kernel: R13: ffff9284c213da00 R14: ffff9284c375f000=
 R15: ffff9db4008efd58
>>>>>> [  720.912945] kernel: FS:  00007f73e6669740(0000) GS:ffff9284dbc8=
0000(0000) knlGS:0000000000000000
>>>>>> [  720.913012] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
>>>>>> [  720.913062] kernel: CR2: ffffdbc681023bc8 CR3: 000000005c2cc000=
 CR4: 00000000000006e0
>>>>>> [  720.913122] kernel: Call Trace:
>>>>>> [  720.913150] kernel:  <TASK>
>>>>>> [  720.913179] kernel:  raid5_make_request+0xb31/0xb90 [raid456]
>>>>>> [  720.913247] kernel:  ? do_wait_intr_irq+0xa0/0xa0
>>>>>> [  720.913292] kernel:  ? __blk_queue_split+0x30a/0x470
>>>>>> [  720.913339] kernel:  md_handle_request+0x119/0x180
>>>>>> [  720.913386] kernel:  md_submit_bio+0x67/0xa0
>>>>>> [  720.913425] kernel:  __submit_bio_fops+0x91/0x160
>>>>>> [  720.913468] kernel:  submit_bio_noacct+0xd7/0x2c0
>>>>>> [  720.913510] kernel:  __blkdev_direct_IO_simple+0x198/0x290
>>>>>> [  720.913576] kernel:  ? __fpu_restore_sig+0x193/0x570
>>>>>> [  720.913623] kernel:  ? sysvec_apic_timer_interrupt+0xaf/0xd0
>>>>>> [  720.913676] kernel:  ? __blkdev_direct_IO_simple+0x290/0x290
>>>>>> [  720.913728] kernel:  generic_file_read_iter+0x9b/0x160
>>>>>> [  720.913775] kernel:  new_sync_read+0x105/0x180
>>>>>> [  720.913820] kernel:  vfs_read+0xf1/0x190
>>>>>> [  720.913858] kernel:  ksys_read+0x4f/0xc0
>>>>>> [  720.913896] kernel:  do_syscall_64+0x38/0x90
>>>>>> [  720.913936] kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>> [  720.913985] kernel: RIP: 0033:0x7f73e676d772
>>>>>> [  720.914024] kernel: Code: c0 e9 b2 fe ff ff 50 48 8d 3d da 2e 0=
c 00 e8 b5 f9 01 00 0f 1f 44 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85=
 c0 75 10 0f 05 <48> 3d 00 f0 ff ff 77 56 c3 0f 1f 44 00 00 48 83 ec 28 4=
8 89 54 24
>>>>>> [  720.914166] kernel: RSP: 002b:00007fff1b8fcbb8 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000000
>>>>>> [  720.914231] kernel: RAX: ffffffffffffffda RBX: 0000000000000040=
 RCX: 00007f73e676d772
>>>>>> [  720.917149] kernel: RDX: 0000000000040000 RSI: 00007f73e65d3000=
 RDI: 0000000000000004
>>>>>> [  720.920078] kernel: RBP: 0000000000001000 R08: 00000000015105c0=
 R09: 0000000000000080
>>>>>> [  720.922980] kernel: R10: 00007fff1b8fca00 R11: 0000000000000246=
 R12: 00000015105c0000
>>>>>> [  720.925875] kernel: R13: 0000000000000004 R14: 00007f73e65d3000=
 R15: 0000000000040000
>>>>>> [  720.928795] kernel:  </TASK>
>>>>>> [  720.931704] kernel: Modules linked in: sctp ip6_udp_tunnel udp_=
tunnel rpcrdma rdma_cm iw_cm ib_cm ib_core sit tunnel4 ip_tunnel rfkill i=
pt_REJECT nf_reject_ipv4 iptable_filter xt_nat iptable_nat nf_nat iptable=
_mangle nf_conntrack_pptp xt_CT iptable_raw xt_multiport xt_set ip6t_REJE=
CT nf_reject_ipv6 xt_LOG nf_log_syslog xt_limit xt_state xt_conntrack nf_=
conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6table_filter ip6_tables ip_set=
_hash_netport ip_set_hash_net ip_set drivetemp it87 nfnetlink hwmon_vid v=
fat fat iTCO_wdt intel_pmc_bxt iTCO_vendor_support at24 raid456 async_rai=
d6_recov async_memcpy async_pq async_xor async_tx intel_powerclamp raid1 =
coretemp snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hd=
a_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_co=
dec snd_hda_core snd_usb_audio i2c_i801 gma500_gfx i2c_smbus snd_usbmidi_=
lib joydev snd_hwdep snd_rawmidi snd_seq_device mc snd_pcm lpc_ich i2c_al=
go_bit snd_timer drm_kms_helper snd cec soundcore nfsd auth_rpcgss
>>>>>> [  720.931885] kernel:  nfs_acl lockd grace drm fuse sunrpc zram i=
p_tables hid_logitech_hidpp serio_raw r8152 sata_sil24 video mii hid_jabr=
a e1000e hid_logitech_dj
>>>>>> [  720.952122] kernel: CR2: ffffdbc681023bc8
>>>>>> [  720.955651] kernel: ---[ end trace de2c3d5b971ae71d ]---
>>>>>> [  720.959186] kernel: RIP: 0010:kfree+0x58/0x3e0
>>>>>> [  720.962723] kernel: Code: 80 4c 01 e5 0f 82 84 03 00 00 48 c7 c=
0 00 00 00 80 48 2b 05 4a 96 3b 01 48 01 c5 48 c1 ed 0c 48 c1 e5 06 48 03=
 2d 28 96 3b 01 <48> 8b 45 08 48 8d 50 ff a8 01 48 0f 45 ea 48 8b 55 08 4=
8 8d 42 ff
>>>>>> [  720.966472] kernel: RSP: 0018:ffff9db4008efaf8 EFLAGS: 00010286=

>>>>>> [  720.970238] kernel: RAX: 00006d7bc0000000 RBX: ffff9284c5214800=
 RCX: ffff9284c3758ff8
>>>>>> [  720.973993] kernel: RDX: ffff9283c1102740 RSI: ffffffffc07af091=
 RDI: ffff9db4008efd58
>>>>>> [  720.977723] kernel: RBP: ffffdbc681023bc0 R08: ffff9db4008efb88=
 R09: ffff9284c3759000
>>>>>> [  720.981464] kernel: R10: 0000000000000028 R11: ffff9284c213db48=
 R12: ffff9db4008efd58
>>>>>> [  720.985228] kernel: R13: ffff9284c213da00 R14: ffff9284c375f000=
 R15: ffff9db4008efd58
>>>>>> [  720.988995] kernel: FS:  00007f73e6669740(0000) GS:ffff9284dbc8=
0000(0000) knlGS:0000000000000000
>>>>>> [  720.992774] kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
>>>>>> [  720.996535] kernel: CR2: ffffdbc681023bc8 CR3: 000000005c2cc000=
 CR4: 00000000000006e0
>>>
>>> I tried a few things (injecting badblocks, etc.) but still could not
>>> reproduce this issue.
>>>
>>> Hi Dominik,
>>>
>>> Could you please share more information about the array?
>>
>> Please note that I repaired the array by stopping it and reassembling
>> without badblocks maps:
>> # mdadm --assemble -U force-no-bbl /dev/md126 /dev/sdb1 /dev/sdc1 /dev=
/sdd1 /dev/sde1 /dev/sdf1
>>
>> I ran fsck on it and repaired multiple-owned blocks. It's been running=

>> smoothly since then, even under kernel 5.16.9. I'm not sure the
>> following information will be useful now.
>=20
> Thanks for these information. I will try to repro with some similar set=
up.
>=20
> Song
>=20
> [..]
>=20
>=20
