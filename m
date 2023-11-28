Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F709748F
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 05:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8L5FTZe"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6cbe68095a3so3814832b3a.3
        for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 21:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701149483; x=1701754283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EEPi9c7ppkLgBeiuzKlkFix1rYtohwubig6Zzx1D7yA=;
        b=X8L5FTZeVXE/20osAaVj8hmtuEscW9J3G2XfG1L70KvxOvOxKN/s8kZXv/6YdB2EBJ
         YMBEbSGOcaxTXWp45XBsu3sJIzXWboqDlPWsRVbu6OMH9HC9TUHZIwNH9LlIt6AHRP7m
         ucokj/n8r/nYZZgTfds3UOoXgQR8PrZ2Y4kiGsxh11GpnkD/7REpXHTrkpozehmktwIG
         aA9r/l3PaEmenHeQol7Vv4Aspq9AJ4AOHpWOoqSxJzOR48BqhjhFZHEH35ITbJk++Q2I
         hxF4Vod7LOlmfAPClm4jbxhVCPfCeRnamka0fA6WblhVEs+NoCEURUq0wO/CdTTPsvbG
         Z7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701149483; x=1701754283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEPi9c7ppkLgBeiuzKlkFix1rYtohwubig6Zzx1D7yA=;
        b=CJ/EDQt6LG8sORxg215enQdvB1xgzIijU5eFj1KNT52rLxIcfNyfOs1Z1pWetx6Tnt
         U6JxfRpOZ0BGsH9M/7Wh+o0mgRbVcGYJFWid8T3jxNoj81kmaoyt6lMWjq3TFCA0gM6S
         xhwOrxSJG9WqeXFm5QAu2UPFmeHELbumk+b7lHrgTNW+iYgg8mRVMhsK2lr+gxbBlsMX
         4oGY/Psc1m/IB6C2kuuAhPz9Kz2Oo4Oh/crjD44j5Gyica7ue/CsbPHwJ43NktfiMRA+
         /LRTHKMsvXHdXlVwfmSIJ8tn+sxUAEhDsji5B6GLEERZsnhUKTwcv+tcW/jbS2rIjSh1
         fUaA==
X-Gm-Message-State: AOJu0YyNrhJ3Ckn+0DfCZh8LFftBsEzLGXD8WhcL0efYjTEFP3ydYXYy
	Yk0aUxw1oNrTu3AyizuKP/u1XwbrgqmDJA==
X-Google-Smtp-Source: AGHT+IGlXC8UReAEZX2Q21EENrre/8ig09+Y/pOPN2cMuhsa5digs3NrGSN7fY2BDBGQ+2jchBphmQ==
X-Received: by 2002:a05:6a20:1445:b0:18c:5c04:5564 with SMTP id a5-20020a056a20144500b0018c5c045564mr8897440pzi.60.1701149482790;
        Mon, 27 Nov 2023 21:31:22 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001cfde3ee4e8sm1655108plx.125.2023.11.27.21.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 21:31:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 024731143686A; Tue, 28 Nov 2023 12:31:19 +0700 (WIB)
Date: Tue, 28 Nov 2023 12:31:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Genes Lists <lists@sapience.com>, tglx@linutronix.de,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	gregory.greenman@intel.com, kvalo@kernel.org,
	Linux Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>
Subject: Re: crash with 6.7 rc2 and rc3
Message-ID: <ZWV7JworMrjHJHsO@archie.me>
References: <c46a6462-8263-455c-a6ea-1860020f5fab@sapience.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sEcx6aMYousCg2QL"
Content-Disposition: inline
In-Reply-To: <c46a6462-8263-455c-a6ea-1860020f5fab@sapience.com>


--sEcx6aMYousCg2QL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 03:55:37PM -0500, Genes Lists wrote:
>=20
> lenovo laptop boots fine under 6.7rc1 and older including 6.6.2 stable.
> but not for 6.7 rc2 or rc3.
>=20
> It has a intel 7260 (rev 3) wireless and :
>=20
> cpu family	: 6
> model		: 60
> model name	: Intel(R) Core(TM) i7-4800MQ CPU @ 2.70GHz
> stepping	: 3
> microcode	: 0x28
>=20
>=20
> As of 6.7 rc2 / rc3 it crashes towards the end of boot bringing up servic=
es
> -  some parts of crash scrolled off the screen so I apologize if this
> (manually transcribed) trace didn't catch the first part.
>=20
> I did a git bisect between rc1 and rc2 but was unable to reproduce the cr=
ash
> for some reason. (I did not do make clean between each bisects).
>=20
> During the bisect it booted every time, but networking was not functional
> for any of the bisects.
>=20
> Hope it's okay to report even though git bisect didn't get anywhere.
>=20
> Gene
>=20
> This is the what I got from screen :
>=20
> CS: 0010 DS: 000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f30cf49ba38 CR3: 000000025b620004 CR4: 00000000001706f0
> Call Trace:
>  <IRQ>
>  ? die_addr+0x36/0x90
>  ? exc_general_protection+0x1c5/0x430
>  ? asm_exc_gemeral_protection+0x26/0x30
>  ? iwl_phy_db_set_section+0xd6/0x1f0 [iwlwifi]
>  ? __kmem_cache_alloc_node+0x1d5/0x2b0
>  ? iwl_phy_db_set_section+0xd6/0x1f0 [iwlwifi]
>  ? iwl_phy_db_set_section+0xd6/0x1f0 [iwlwifi]
>  __kmalloc_node_track_caller+0x51/0x160
>  kmemdup+0x20/0x50
>  iwl_phy_db_set_section+0xd6/0x1f0 [iwlwifi]
>  iwl_wait_phy_db_entry+0x2f/0x40 [iwlmvm]
>  iwl_notification_wait+0xb0/0xf0 [iwlwifi]
>  iwl_mvm_rx_common+0x8e/0x320 [iwlwifi]
>  iwl_pcie_napi_poll+0x2d/0x150 [iwlwifi]
>  __napi_poll+0x2b/0x1c0
>  net_rx_action+0x2b4/0x320
>  __do_softirq+0xff/0x339
>  net_rx_action+0x2b4/0x320
>  __do_softirq.part.0+0x88/0xa0
> </IRQ>
> <TASK>
> __local_bh_enable_ip+0x91/0xa0
> iwl_pcie_irq_handler+0x58d/0xc40 [iwlwifi]
> ? __pfx_irq_thread_fn+0x10/0x10
> irq_thread_fn+0x23/0x60
> irq_thread+0xfe/0x60
> ? __pfx_irq_thread_dtor+0x10/0x10
> ? __pfx_irq_thread+0x10/0x10
> kthread+0xfa/0x130
> ? pff_kthread+0x10/0x10
> ret_from_fork+0x34/0x50
> ? __pfx_kthread+0x10/0x10
> ret_from_fork_asm+0x1b/0x30

Do you have any full system logs that can be attached?

Anyway, thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: v6.7-rc1..v6.7-rc2

--=20
An old man doll... just what I always wanted! - Clara

--sEcx6aMYousCg2QL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWV7IgAKCRD2uYlJVVFO
o02/AQDz9zBxC7l3PA7XiPWORmbSKTBUjAJWCjZ4HQCsGtw9ZgEA7Zige0E/cGXL
q1/LpBIwpT3tfL752nITIl7B/mcKdwg=
=C092
-----END PGP SIGNATURE-----

--sEcx6aMYousCg2QL--
