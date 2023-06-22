Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE091F186
	for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 14:15:02 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b543f7e53aso47300365ad.1
        for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687443302; x=1690035302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdciB8cBXbF3HOfRChPi09/xGSPduZce8TS92lT1i1g=;
        b=mq85+RB3mZTWLEtStsSpClAWerZ0jcbIQ+EA8OQa7thefpv8At+Q/XFJ7CxVoY+yGj
         bxgnw8T6ISoU9OMsHrefE9VPw8YGI0RzQvBcQXwiqEI+1WaECGWpwrcrqqg6D0bIQSk5
         JcaOoHSo/WTWe787yS2pk2wTvNuIgrRU80Kf2K2tCVcdBF2xy+vbGaErNlntYToEgapF
         T1kwC33KgYOEwVIPLq5Y7NFedYeUsvKf86coo6g29NBuuvLuz4yFUzu7S6rhB8NcOkcR
         rZsAo8dPJy0J3yT1lWPAawEBoOXCrDsVKT5PYo719Zi2NFsK1N99bm4f4QGIPlVPtmOa
         7h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443302; x=1690035302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdciB8cBXbF3HOfRChPi09/xGSPduZce8TS92lT1i1g=;
        b=NwmsaNrHU0OleIXnb++uWOL2HnvOlt2ALHBLMEbRV6wuIMAOMzvcvzNommUaMLiPaM
         E9jzOZLf0iO4/YNY8/Yh897W2v5PsB7TdlHi0tEKvY/yKMr9V1BW/HgOc5/6SGFkrI/b
         h08bj5cuz4BomGpgbCmGfuBdzbcueGvXii21FGAj6yMBWAS7fGVTQX2V4bOesbcAifqm
         ONbKm5EeopKxnTyCA/wR90UiT8AEeZEAlt6ChJM+nrzFfM1q8w7E1JwsEzJyntMeU+Md
         UeQqgOQVaceUyhUgBWb/W1ovB+bt1lpndRv97hUYJJIBMlssv4CrAssO4ty1p6SOGdpE
         sBEQ==
X-Gm-Message-State: AC+VfDyEpwCkHnUDEmAGRsvMcibxepgyhsfFLPgquXueCTLzziOtgjN6
	KCB6zvVp3GsMYafEwHFactw8BaqWjUg=
X-Google-Smtp-Source: ACHHUZ6wXFev3FOKDtZLXkM7PxvI2QSUX9gvHiKVPQmEdxpcKDjRpyjan4AbMPM4ILUd/wwiRY2zNQ==
X-Received: by 2002:a17:902:8214:b0:1aa:d971:4623 with SMTP id x20-20020a170902821400b001aad9714623mr17169274pln.38.1687443301552;
        Thu, 22 Jun 2023 07:15:01 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-32.three.co.id. [116.206.12.32])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902e9c400b001b3d7205401sm5433304plk.303.2023.06.22.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:15:01 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 78E118C1AAA9; Thu, 22 Jun 2023 21:14:58 +0700 (WIB)
Date: Thu, 22 Jun 2023 21:14:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tobias Klausmann <tobias.klausmann@freenet.de>, hkallweit1@gmail.com,
	nic_swsd@realtek.com, netdev@vger.kernel.org
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Holger =?utf-8?Q?Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
	"David S. Miller" <davem@davemloft.net>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: r8169: transmit transmit queue timed out - v6.4 cycle
Message-ID: <ZJRXYtfY4jFi934A@debian.me>
References: <c3465166-f04d-fcf5-d284-57357abb3f99@freenet.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+d9E7qC/pAv6xDBF"
Content-Disposition: inline
In-Reply-To: <c3465166-f04d-fcf5-d284-57357abb3f99@freenet.de>


--+d9E7qC/pAv6xDBF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: all people in the SoB chain of culprit]

On Thu, Jun 22, 2023 at 03:46:48PM +0200, Tobias Klausmann wrote:
> Hello all,
>=20
> introduced in the 6.4 cycle r8169 show transmit queue timeouts [1].
> Bisecting the problem brought me to the following commit:
>=20
> 2ab19de62d67e403105ba860971e5ff0d511ad15 is the first bad commit
> commit 2ab19de62d67e403105ba860971e5ff0d511ad15
> Author: Heiner Kallweit <hkallweit1@gmail.com>
> Date:=C2=A0=C2=A0 Mon Mar 6 22:28:06 2023 +0100
>=20
> =C2=A0=C2=A0=C2=A0 r8169: remove ASPM restrictions now that ASPM is disab=
led during NAPI
> poll
>=20
> =C2=A0=C2=A0=C2=A0 Now that=C2=A0 ASPM is disabled during NAPI poll, we c=
an remove all ASPM
> =C2=A0=C2=A0=C2=A0 restrictions. This allows for higher power savings if =
the network
> =C2=A0=C2=A0=C2=A0 isn't fully loaded.
>=20
> =C2=A0=C2=A0=C2=A0 Reviewed-by: Simon Horman <simon.horman@corigine.com>
> =C2=A0=C2=A0=C2=A0 Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> =C2=A0=C2=A0=C2=A0 Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asyn=
chrony.com>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: David S. Miller <davem@davemloft.net>
>=20
> =C2=A0drivers/net/ethernet/realtek/r8169_main.c | 27 +-------------------=
-------
> =C2=A01 file changed, 1 insertion(+), 26 deletions(-)
>=20
>=20
> With this commit reverted on top of v6.4-rc6, the timeouts are gone.
>=20
> The NIC identifies as "03:00.0 Ethernet controller: Realtek Semiconductor
> Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev
> 15)"
>=20
> Greetings,
>=20
> Tobias Klausmann
>=20
>=20
> [1]:
>=20
> [ 2070.918700] ------------[ cut here ]------------
> [ 2070.918708] NETDEV WATCHDOG: enp3s0 (r8169): transmit queue 0 timed out
> 5317 ms
> [ 2070.918719] WARNING: CPU: 4 PID: 0 at net/sched/sch_generic.c:525
> dev_watchdog+0x1c9/0x1d0
> [ 2070.918726] Modules linked in: rfcomm(E) af_packet(E) cmac(E)
> algif_hash(E) algif_skcipher(E) af_alg(E) bnep(E) btusb(E) btrtl(E)
> uvcvideo(E) btbcm(E) uvc(E) btintel(E) videobuf2_vmalloc(E) btmtk(E)
> videobuf2_memops(E) rtsx_usb_sdmmc(E) videobuf2_v4l2(E) bluetooth(E)
> rtsx_usb_ms(E) mmc_core(E) ecdh_generic(E) memstick(E) ecc(E) videodev(E)
> videobuf2_common(E) mc(E) rtsx_usb(E) qrtr(E) nls_iso8859_1(E) nls_cp437(=
E)
> vfat(E) fat(E) joydev(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E)
> ledtrig_audio(E) snd_hda_codec_hdmi(E) ath10k_pci(E) ath10k_core(E)
> hid_multitouch(E) ath(E) snd_hda_intel(E) snd_intel_dspcfg(E) iTCO_wdt(E)
> ee1004(E) intel_rapl_msr(E) snd_intel_sdw_acpi(E) intel_pmc_bxt(E)
> snd_hda_codec(E) mac80211(E) iTCO_vendor_support(E) r8169(E)
> intel_rapl_common(E) snd_hda_core(E) intel_tcc_cooling(E) mei_hdcp(E)
> x86_pkg_temp_thermal(E) acer_wmi(E) intel_powerclamp(E) cfg80211(E)
> snd_hwdep(E) sparse_keymap(E) coretemp(E) snd_pcm(E) realtek(E) i2c_i801(=
E)
> wmi_bmof(E) intel_wmi_thunderbolt(E)
> [ 2070.918794]=C2=A0 snd_timer(E) rfkill(E) mdio_devres(E) libphy(E) liba=
rc4(E)
> efi_pstore(E) snd(E) i2c_smbus(E) soundcore(E) mei_me(E) intel_lpss_pci(E)
> intel_lpss(E) mei(E) idma64(E) intel_pch_thermal(E) thermal(E) battery(E)
> ac(E) acpi_pad(E) tiny_power_button(E) fuse(E) configfs(E) dmi_sysfs(E)
> ip_tables(E) x_tables(E) hid_generic(E) usbhid(E) crct10dif_pclmul(E)
> nouveau(E) crc32_pclmul(E) crc32c_intel(E) i915(E) polyval_clmulni(E)
> drm_ttm_helper(E) polyval_generic(E) ghash_clmulni_intel(E) mxm_wmi(E)
> drm_buddy(E) sha512_ssse3(E) i2c_algo_bit(E) aesni_intel(E)
> drm_display_helper(E) crypto_simd(E) drm_kms_helper(E) syscopyarea(E)
> sysfillrect(E) cryptd(E) sysimgblt(E) cec(E) xhci_pci(E) ttm(E) xhci_hcd(=
E)
> usbcore(E) drm(E) usb_common(E) i2c_hid_acpi(E) i2c_hid(E) video(E) wmi(E)
> pinctrl_sunrisepoint(E) button(E) serio_raw(E) sg(E) dm_multipath(E)
> dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) msr(E) efivarfs(=
E)
> [ 2070.918862] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 E=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> 6.4.0-rc1-desktop-debug+ #51
> [ 2070.918864] Hardware name: Acer Aspire VN7-593G/Pluto_KLS, BIOS V1.11
> 08/01/2018
> [ 2070.918866] RIP: 0010:dev_watchdog+0x1c9/0x1d0
> [ 2070.918869] Code: d5 eb 92 48 89 ef c6 05 5a 34 96 00 01 e8 2f d0 fb ff
> 45 89 f8 44 89 f1 48 89 ee 48 89 c2 48 c7 c7 58 5c f2 91 e8 07 c6 83 ff <=
0f>
> 0b e9 74 ff ff ff 41 55 41 54 55 53 48 8b 47 50 4c 8b 28 48 85
> [ 2070.918872] RSP: 0018:ffffbcec00220eb8 EFLAGS: 00010286
> [ 2070.918875] RAX: 0000000000000000 RBX: ffff94f0104843dc RCX:
> 000000000000083f
> [ 2070.918877] RDX: 0000000000000000 RSI: 00000000000000f6 RDI:
> 000000000000003f
> [ 2070.918878] RBP: ffff94f010484000 R08: 0000000000000001 R09:
> 0000000000000000
> [ 2070.918880] R10: ffff94f1b6aa0000 R11: ffff94f1b6aa0000 R12:
> ffff94f010484488
> [ 2070.918881] R13: ffff94f0031a0600 R14: 0000000000000000 R15:
> 00000000000014c5
> [ 2070.918883] FS:=C2=A0 0000000000000000(0000) GS:ffff94f1b6d00000(0000)
> knlGS:0000000000000000
> [ 2070.918885] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2070.918887] CR2: 00007f8eea510000 CR3: 000000023322e005 CR4:
> 00000000003706e0
> [ 2070.918889] Call Trace:
> [ 2070.918891]=C2=A0 <IRQ>
> [ 2070.918893]=C2=A0 ? mq_change_real_num_tx+0xe0/0xe0
> [ 2070.918897]=C2=A0 ? mq_change_real_num_tx+0xe0/0xe0
> [ 2070.918899]=C2=A0 call_timer_fn.isra.0+0x17/0x70
> [ 2070.918903]=C2=A0 __run_timers.part.0+0x1b2/0x200
> [ 2070.918907]=C2=A0 ? tick_sched_do_timer+0x80/0x80
> [ 2070.918910]=C2=A0 ? hw_breakpoint_pmu_read+0x10/0x10
> [ 2070.918913]=C2=A0 ? ktime_get+0x33/0xa0
> [ 2070.918915]=C2=A0 run_timer_softirq+0x21/0x50
> [ 2070.918918]=C2=A0 __do_softirq+0xb8/0x1ea
> [ 2070.918923]=C2=A0 irq_exit_rcu+0x75/0xa0
> [ 2070.918926]=C2=A0 sysvec_apic_timer_interrupt+0x66/0x80
> [ 2070.918929]=C2=A0 </IRQ>
> [ 2070.918930]=C2=A0 <TASK>
> [ 2070.918932]=C2=A0 asm_sysvec_apic_timer_interrupt+0x16/0x20
> [ 2070.918935] RIP: 0010:cpuidle_enter_state+0xa7/0x2a0
> [ 2070.918938] Code: 45 40 40 0f 84 9f 01 00 00 e8 65 00 6e ff e8 10 f8 ff
> ff 31 ff 49 89 c5 e8 66 64 6d ff 45 84 ff 0f 85 76 01 00 00 fb 45 85 f6 <=
0f>
> 88 be 00 00 00 49 63 ce 48 8b 04 24 48 6b d1 68 49 29 c5 48 89
> [ 2070.918939] RSP: 0018:ffffbcec0012fe90 EFLAGS: 00000202
> [ 2070.918942] RAX: ffff94f1b6d25d80 RBX: 0000000000000008 RCX:
> 0000000000000000
> [ 2070.918943] RDX: 000001e22c5f9004 RSI: fffffffdc849289f RDI:
> 0000000000000000
> [ 2070.918945] RBP: ffff94f1b6d2fa00 R08: 0000000000000002 R09:
> 000000002d959839
> [ 2070.918946] R10: ffff94f1b6d24904 R11: 00000000000018c7 R12:
> ffffffff92155720
> [ 2070.918948] R13: 000001e22c5f9004 R14: 0000000000000008 R15:
> 0000000000000000
> [ 2070.918951]=C2=A0 cpuidle_enter+0x24/0x40
> [ 2070.918954]=C2=A0 do_idle+0x1c0/0x220
> [ 2070.918958]=C2=A0 cpu_startup_entry+0x14/0x20
> [ 2070.918960]=C2=A0 start_secondary+0x109/0x130
> [ 2070.918963]=C2=A0 secondary_startup_64_no_verify+0xf4/0xfb
> [ 2070.918966]=C2=A0 </TASK>
> [ 2070.918968] ---[ end trace 0000000000000000 ]---
> [ 2072.163726] pcieport 0000:00:1c.3: Data Link Layer Link Active not set=
 in
> 1000 msec
> [ 2072.165868] r8169 0000:03:00.0 enp3s0: Can't reset secondary PCI bus,
> detach NIC
>=20

Thanks for the bug report. To be sure it doesn't get fallen through the
cracks unnoticed, I'm adding it to regzbot:

#regzbot ^introduced: 2ab19de62d67e4
#regzbot title: transmit queue timeout on r8169

Bye!

--=20
An old man doll... just what I always wanted! - Clara

--+d9E7qC/pAv6xDBF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZJRXXgAKCRD2uYlJVVFO
ozyaAQCtrUXCrPunBbcFZcQPH1lMLoPYgARQYPNxMDLWUjHWiQD9GB8EdzHFjeac
W2VTfAS9928h3hV/nj/tqkC2F5662gA=
=R7+9
-----END PGP SIGNATURE-----

--+d9E7qC/pAv6xDBF--
