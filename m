Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E518037
	for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 22:04:33 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so13572148b3a.3
        for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 15:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696111473; x=1696716273; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cbs5xNP9oIxBVloNdkeNDVaHDBX2pA+N6UUM3l5vJ6g=;
        b=b1eMQ5Ac/dvHV2Z99eoHHRyu5b/vdh8je35776IsqSIkyHb++O4mLKu+TT8jD2K8Zv
         FefudAIxFukh3cPKIy5r8NTK/TJspZURO1o9rmfqwVTUYnuLh48sqWP9ywJhd6kpkgtO
         LluXPlO6m6yOyH+cE7ZwHcNSS8BLWadzcubXBAmbQx62XIqQ5w/ndI8lyuGeGFRRPdtx
         ezUxFB7wkP2a16dtqZQTdzeuuW6gRt+n0f5Be3yIWyjCY0qyiNjMRVOhTN06y7P7ZSx2
         Q7EulXTvWDAK+isRfWrs2vTm2cDuJfCI4+TcIDXFlguuGAosLEUOfiykcr+cp7ML2Oko
         kh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696111473; x=1696716273;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cbs5xNP9oIxBVloNdkeNDVaHDBX2pA+N6UUM3l5vJ6g=;
        b=e3INzd4fMIeASYtByOdkIxF4n9OdbM5AP4VveLQa1P+jyxcVp2mTCUn8sd+lA+iIcW
         5xt7QoEtRNQzPLoILjwatUT/1tl4MjxGbLZmEs+y+hKWlOeua8OmZvTqzDoCYu8maX/q
         grdrpPHohXGXhfCxL+yFux0RmxOwRsTmfoWIwXzVgwfh1kJA1JjcaP7/YlKQgyKfoDWZ
         LF92AyfcSJQiwbxaJve5H58QwEFtGTLBMj1zaTbqIGdUVg3UwRuLCxpzq36001OoXpjD
         1L0B95go3e44CiTuQy8ysI+x9fACAEvCnsr/fQgdDaKCHMZu0oV8Mi/oxtbQCPLE7TLV
         0AKw==
X-Gm-Message-State: AOJu0YyF6I/lC7UDZt6ij4F13jrp6H5fdTqKKoM214c7Jo3igF34u+7y
	ZdfN7pn6G5LdlRDezDPdVHiLoA5mABEFukhPebAMI88NlKo=
X-Google-Smtp-Source: AGHT+IGJU6tEVvm4f4TSzM5AhvlhgveTOYbn7fHayf3RPR7e+4cAM82VAS4ey71/pEsCTj2omKZEZ9/G063GCPnjUI4=
X-Received: by 2002:a05:6a20:3c8e:b0:13f:9cee:ff42 with SMTP id
 b14-20020a056a203c8e00b0013f9ceeff42mr10023045pzj.41.1696111472921; Sat, 30
 Sep 2023 15:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: enc0der <enc0der@gmail.com>
Date: Sat, 30 Sep 2023 18:04:22 -0400
Message-ID: <CAEXpi5Rd6Y4umKOWRsCjX0kit=W5ZrVhn=MuRkyvJPwmjjDVnA@mail.gmail.com>
Subject: rt8000usb driver issue (maybe interaction with other drivers)
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello all!

This is the first time I have ever reported anything linux related, so
if this is not the proper way, please let me know what the correct way
is.

I am using an NVIDIA Jetson Orin Nano developer platform.  They
release what they call a jetpack that comes with linux and their
additions on top.  We are using the latest version they release (just
released about a month ago)

When I plug in a USB WiFi adapter that uses the rt8000usb driver, if I
connect to a network it sees, I get a kernel panic.  If I have
"automatically connect" it kernel panics when I plug the USB in.

The version of the kernel they ship is:

5.10.120-tegra. (tegra is their additions)

I talked with NVIDIA first on what I was seeing and after looking at
my log, they said it is likely a driver problem.

Right after I plug in the device, this is the sequence of messages I see:

[  264.400281] BUG: scheduling while atomic: NetworkManager/622/0x00000203
[  264.408778] BUG: scheduling while atomic: NetworkManager/622/0xfffffdff
[  264.417178] BUG: scheduling while atomic: swapper/2/0/0x00000504
[  264.423685] bad: scheduling from the idle thread!

Then it panics

Sometimes it prints more, like:

[   21.657382] BUG: scheduling while atomic: NetworkManager/630/0x00000203
[   21.664818] WARNING: CPU: 4 PID: 630 at
kernel/rcu/tree_plugin.h:297 rcu_note_context_switch+0x50/0x540
[   21.675028] ---[ end trace 62dc42c98ec427c8 ]---
[   21.679873] BUG: scheduling while atomic: NetworkManager/630/0x00000505
[   21.687591] WARNING: CPU: 4 PID: 0 at kernel/rcu/tree.c:624
rcu_eqs_enter.isra.0+0x128/0x130
[   21.696512] ---[ end trace 62dc42c98ec427c9 ]---

I've also seen this:

[   27.885487] Unable to handle kernel paging request at virtual
address 0000000000001000
[   27.893656] Mem abort info:
[   27.896524]   ESR = 0x86000004
[   27.899664]   EC = 0x21: IABT (current EL), IL = 32 bits
[   27.905124]   SET = 0, FnV = 0
[   27.908257]   EA = 0, S1PTW = 0
[   27.911480] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001110cb000
[   27.918090] [0000000000001000] pgd=0000000000000000, p4d=0000000000000000
[   27.925066] Internal error: Oops: 86000004 [#1] PREEMPT SMP
[   27.930794] Modules linked in: mtd_blkdevs(E) mtd(E) lzo_rle(E)
lzo_compress(E) zram(E) ramoops(E) reed_solomon(E) bnep(E) loop(E)
rt2800usb(E) rt2x00usb(E) rt2800lib(E) rt2x00lib(E) aes_ce_blk(E)
rtl8822ce(E) mac80211(E) crypto_simd(E) cryptd(E) rtk_btusb(E)
snd_soc_tegra186_asrc(E) input_leds(E) snd_soc_tegra186_dspk(E)
snd_soc_tegra210_ope(E) aes_ce_cipher(E) snd_soc_tegra186_arad(E)
snd_soc_tegra210_iqc(E) ghash_ce(E) btusb(E) snd_soc_tegra210_mvc(E)
snd_soc_tegra210_afc(E) sha2_ce(E) btrtl(E) snd_soc_tegra210_amx(E)
snd_soc_tegra210_dmic(E) snd_soc_tegra210_adx(E) r8168(E)
snd_soc_tegra210_adsp(E) snd_soc_tegra210_admaif(E) sha256_arm64(E)
btbcm(E) snd_soc_tegra210_mixer(E) snd_soc_tegra210_sfc(E)
snd_soc_tegra210_i2s(E) cfg80211(E) snd_soc_tegra_machine_driver(E)
snd_soc_tegra_pcm(E) sha1_ce(E) btintel(E) snd_hda_codec_hdmi(E)
snd_soc_tegra_utils(E) snd_hda_tegra(E) snd_soc_simple_card_utils(E)
snd_soc_spdif_tx(E) nvadsp(E) snd_soc_tegra210_ahub(E)
snd_hda_codec(E) userspace_alert(E)
[   27.930905]  snd_hda_core(E) tegra_bpmp_thermal(E) nv_imx219(E)
spi_tegra114(E) tegra210_adma(E) nvidia(OE) binfmt_misc(E) ina3221(E)
pwm_fan(E) nvgpu(E) nvmap(E) ip_tables(E) x_tables(E) [last unloaded:
mtdblock]
[   28.042400] CPU: 4 PID: 630 Comm: NetworkManager Tainted: G
W  OE     5.10.120-tegra #1
[   28.051233] Hardware name: Unknown NVIDIA Orin Nano Developer
Kit/NVIDIA Orin Nano Developer Kit, BIOS 4.1-33958178 08/01/2023
[   28.062910] pstate: 60400089 (nZCv daIf +PAN -UAO -TCO BTYPE=--)
[   28.069071] pc : 0x1000
[   28.071586] lr : arm_smmu_dma_sync+0x40/0x70
[   28.075965] sp : ffff8000100231a0
[   28.079365] x29: 0000000000001000 x28: ffff4655c01d0ec0
[   28.084817] x27: ffffaced1f227000 x26: ffff4655c6ee32c0
[   28.090270] x25: 0000000000000000 x24: ffffaced1e405858
[   28.095718] x23: ffff46572e84ae00 x22: ffff4655c6ee2c40
[   28.101165] x21: ffff4655c82c3480 x20: ffffaced1db49e08
[   28.106618] x19: ffff8000100231c0 x18: 0000000000010101
[   28.112073] x17: 0000000000cccccc x16: ffffaced1d23382c
[   28.117520] x15: 0000000000000000 x14: 0000000000000000
[   28.122970] x13: 0000000000000001 x12: 0000000000000000
[   28.128421] x11: 0000000000000008 x10: 0000000000000ab0
[   28.133863] x9 : ffff800010023180 x8 : ffff4655c6ee3750
[   28.139309] x7 : 000000067eb29c20 x6 : 0000000000000238
[   28.144763] x5 : 00000000410fd420 x4 : 0000000000f0000f
[   28.150214] x3 : 0000000000001000 x2 : ffff4655c82c3480
[   28.155658] x1 : ffffaced1db49e08 x0 : ffff465704c37558
[   28.161107] Call trace:
[   28.163620]  0x1000
[   28.165777] Code: bad PC value
[   28.168911] ---[ end trace 62dc42c98ec427ca ]---
[   28.183964] Kernel panic - not syncing: Oops: Fatal exception
[   28.189864] SMP: stopping secondary CPUs
[   29.275883] SMP: failed to stop secondary CPUs 0-5
[   29.280811] Kernel Offset: 0x2ced0d200000 from 0xffff800010000000
[   29.287066] PHYS_OFFSET: 0xffffb9ab40000000
[   29.291360] CPU features: 0x08040006,4a80aa38
[   29.295832] Memory Limit: none
[   29.309234] ---[ end Kernel panic - not syncing: Oops: Fatal exception ]---

(This one I believe when I started with the wifi adapter connected to
USB3 and networking was set to automatically connect.

I see in the git repo that these drivers have been changed over the
last few years.  Given the age of the kernel that NVIDIA is using, I
am not sure how to correlate changes listed in the history of the
files with the release.  I guess I could download and diff them until
I figure out where.

I'm just not sure where to go from here.  I do know without question,
older versions of these drivers work on the Jetson Nano and Raspberry
Pi 3 which are MUCH older kernels.

Thanks for taking a look at this,
Rick
