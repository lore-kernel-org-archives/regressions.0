Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F57F4420
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 09:34:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31f71b25a99so6520551f8f.2
        for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695202439; x=1695807239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWyqoLmeaaOwODoRrL5jboorSOtfNdH2h1dImSlsub8=;
        b=BZIjA41tvlyc5BcgcRayFRyD7/OQ2/cmNMahJ8hsAxjfwMOZEv30qZaah1s9qPffWk
         SxwlSnZtXdaimKT2L0Sw9VdTEJHZA5LuljqTkizhINOCxB153wTf8zlxswbtC1tBXXYO
         pX0VBOdrr5mBjL2MFEpZi0fRlceRHLe61xF7Zzx6HS2DJaAOKo0O2PUH/5Cq1/NREf9z
         RuiYSIj3z1t2s+XxUtzO/k2iBB5csv24AxjgBcuxlhUpYH+pVBpwD0ET/jz/Mhe9Gp9e
         djGa+aLrFiPpmvKbGgL9v6HBEf00rPJ68Bf6eZhimFoxWmtNKbw2s04FGi/m2vTxKVSu
         Tjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695202439; x=1695807239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWyqoLmeaaOwODoRrL5jboorSOtfNdH2h1dImSlsub8=;
        b=s98RulwjUU6srLjkDMsDNIJ+E/zO5tzrzGgSgV/Q3Y7Z13Z2lnF9tljfAl085T/oy3
         DtdEXmDAe4tRVq3vWxX0o/tmJpT59hq3AZB8vl1SHSTQfJ3+aW+M5YMIptH2uaP02sjC
         aG+uXCNVS3BEwEKA2iKDfMWLpfqorLFFCuIZIGlXPXTpBIOvFel0eskeoKf7ZnZBQJ6v
         Y/e918VH69I+149uz4OUnMMGSU+dQyaJF4K5ykk9tLiaT2y08z6/R3GCbv/V8gVmpAc0
         JU8QdfYTiUBKqVPGpoeXWwHOV2UbrqI5isvHK2bK8FgTC7dl3C/dnbZ6Wmh2yDc4wGR8
         r5Ug==
X-Gm-Message-State: AOJu0Ywlau7+JC+pTNT1XJkfIUqhP3rgcamC1982Ftg300VUBXlCwdfI
	tT6GPL3J94KeYEIXaqREsEM=
X-Google-Smtp-Source: AGHT+IH5grgN+EniL9OPhwGX9ayu2yvDR7UwBsmY+wf/nVazUq2HPlxNR+YdomWCvEtJjTE7cD2Mvw==
X-Received: by 2002:a5d:4a82:0:b0:31f:ec91:39a7 with SMTP id o2-20020a5d4a82000000b0031fec9139a7mr1981682wrq.14.1695202438899;
        Wed, 20 Sep 2023 02:33:58 -0700 (PDT)
Received: from [192.168.1.7] (82-64-78-170.subs.proxad.net. [82.64.78.170])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d5052000000b0031ad5470f89sm13194573wrt.18.2023.09.20.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 02:33:58 -0700 (PDT)
Date: Wed, 20 Sep 2023 11:33:51 +0200
From: Paul Grandperrin <paul.grandperrin@gmail.com>
Subject: RE: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
 drivers/misc/cardreader breaks NVME power state, preventing system boot
To: Ricky WU <ricky_wu@realtek.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Linux regressions mailing list
	<regressions@lists.linux.dev>, stable@vger.kernel.org, Wei_wang
	<wei_wang@realsil.com.cn>, Roger Tseng <rogerable@realtek.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Message-Id: <FK2A1S.OMEJ59SJW1RG3@gmail.com>
In-Reply-To: <995632624f0e4d26b73fb934a8eeaebc@realtek.com>
References: <5DHV0S.D0F751ZF65JA1@gmail.com>
	<82469f2f-59e4-49d5-823d-344589cbb119@leemhuis.info>
	<2023091333-fiftieth-trustless-d69d@gregkh>
	<7991b5bd7fb5469c971a2984194e815f@realtek.com>
	<2023091921-unscented-renegade-6495@gregkh>
	<995632624f0e4d26b73fb934a8eeaebc@realtek.com>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Ricky,
I'm going to test it right now! Thanks!

On Wed, Sep 20 2023 at 07:30:00 +00:00:00, Ricky WU=20
<ricky_wu@realtek.com> wrote:
> Hi Greg k-h,
>=20
> This patch is our solution for this issue...
> And now how can I push this?
>=20
> Hi Paul=EF=BC=8C
>=20
> Can you help to try this patch? Is it work for your platform?
>=20
> Ricky
>=20
>=20
> ---
>  drivers/misc/cardreader/rts5227.c  | 55 ++++------------------------
>  drivers/misc/cardreader/rts5228.c  | 57=20
> +++++++++---------------------
>  drivers/misc/cardreader/rts5249.c  | 56 ++++-------------------------
>  drivers/misc/cardreader/rts5260.c  | 43 +++++++---------------
>  drivers/misc/cardreader/rts5261.c  | 52 +++++++--------------------
>  drivers/misc/cardreader/rtsx_pcr.c | 51 +++++++++++++++++++++++---
>  6 files changed, 102 insertions(+), 212 deletions(-)
>=20
> diff --git a/drivers/misc/cardreader/rts5227.c=20
> b/drivers/misc/cardreader/rts5227.c
> index 3dae5e3a1697..cd512284bfb3 100644
> --- a/drivers/misc/cardreader/rts5227.c
> +++ b/drivers/misc/cardreader/rts5227.c
> @@ -83,63 +83,20 @@ static void rts5227_fetch_vendor_settings(struct=20
> rtsx_pcr *pcr)
>=20
>  static void rts5227_init_from_cfg(struct rtsx_pcr *pcr)
>  {
> -	struct pci_dev *pdev =3D pcr->pci;
> -	int l1ss;
> -	u32 lval;
>  	struct rtsx_cr_option *option =3D &pcr->option;
>=20
> -	l1ss =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
> -	if (!l1ss)
> -		return;
> -
> -	pci_read_config_dword(pdev, l1ss + PCI_L1SS_CTL1, &lval);
> -
>  	if (CHK_PCI_PID(pcr, 0x522A)) {
> -		if (0 =3D=3D (lval & 0x0F))
> -			rtsx_pci_enable_oobs_polling(pcr);
> -		else
> +		if (rtsx_check_dev_flag(pcr, ASPM_L1_1_EN | ASPM_L1_2_EN
> +				| PM_L1_1_EN | PM_L1_2_EN))
>  			rtsx_pci_disable_oobs_polling(pcr);
> +		else
> +			rtsx_pci_enable_oobs_polling(pcr);
>  	}
>=20
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_1)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_1_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, ASPM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_2)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_2_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, ASPM_L1_2_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_1)
> -		rtsx_set_dev_flag(pcr, PM_L1_1_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, PM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_2)
> -		rtsx_set_dev_flag(pcr, PM_L1_2_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, PM_L1_2_EN);
> -
>  	if (option->ltr_en) {
> -		u16 val;
> -
> -		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
> -		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
> -			option->ltr_enabled =3D true;
> -			option->ltr_active =3D true;
> +		if (option->ltr_enabled)
>  			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
> -		} else {
> -			option->ltr_enabled =3D false;
> -		}
>  	}
> -
> -	if (rtsx_check_dev_flag(pcr, ASPM_L1_1_EN | ASPM_L1_2_EN
> -				| PM_L1_1_EN | PM_L1_2_EN))
> -		option->force_clkreq_0 =3D false;
> -	else
> -		option->force_clkreq_0 =3D true;
> -
>  }
>=20
>  static int rts5227_extra_init_hw(struct rtsx_pcr *pcr)
> @@ -195,7 +152,7 @@ static int rts5227_extra_init_hw(struct rtsx_pcr=20
> *pcr)
>  		}
>  	}
>=20
> -	if (option->force_clkreq_0 && pcr->aspm_mode =3D=3D ASPM_MODE_CFG)
> +	if (option->force_clkreq_0)
>  		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, PETXCFG,
>  				FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_LOW);
>  	else
> diff --git a/drivers/misc/cardreader/rts5228.c=20
> b/drivers/misc/cardreader/rts5228.c
> index f4ab09439da7..0c7f10bcf6f1 100644
> --- a/drivers/misc/cardreader/rts5228.c
> +++ b/drivers/misc/cardreader/rts5228.c
> @@ -386,59 +386,25 @@ static void rts5228_process_ocp(struct rtsx_pcr=20
> *pcr)
>=20
>  static void rts5228_init_from_cfg(struct rtsx_pcr *pcr)
>  {
> -	struct pci_dev *pdev =3D pcr->pci;
> -	int l1ss;
> -	u32 lval;
>  	struct rtsx_cr_option *option =3D &pcr->option;
>=20
> -	l1ss =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
> -	if (!l1ss)
> -		return;
> -
> -	pci_read_config_dword(pdev, l1ss + PCI_L1SS_CTL1, &lval);
> -
> -	if (0 =3D=3D (lval & 0x0F))
> -		rtsx_pci_enable_oobs_polling(pcr);
> -	else
> +	if (rtsx_check_dev_flag(pcr, ASPM_L1_1_EN | ASPM_L1_2_EN
> +				| PM_L1_1_EN | PM_L1_2_EN))
>  		rtsx_pci_disable_oobs_polling(pcr);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_1)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_1_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, ASPM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_2)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_2_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, ASPM_L1_2_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_1)
> -		rtsx_set_dev_flag(pcr, PM_L1_1_EN);
>  	else
> -		rtsx_clear_dev_flag(pcr, PM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_2)
> -		rtsx_set_dev_flag(pcr, PM_L1_2_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, PM_L1_2_EN);
> +		rtsx_pci_enable_oobs_polling(pcr);
>=20
>  	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, 0xFF, 0);
> -	if (option->ltr_en) {
> -		u16 val;
>=20
> -		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
> -		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
> -			option->ltr_enabled =3D true;
> -			option->ltr_active =3D true;
> +	if (option->ltr_en) {
> +		if (option->ltr_enabled)
>  			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
> -		} else {
> -			option->ltr_enabled =3D false;
> -		}
>  	}
>  }
>=20
>  static int rts5228_extra_init_hw(struct rtsx_pcr *pcr)
>  {
> +	struct rtsx_cr_option *option =3D &pcr->option;
>=20
>  	rtsx_pci_write_register(pcr, RTS5228_AUTOLOAD_CFG1,
>  			CD_RESUME_EN_MASK, CD_RESUME_EN_MASK);
> @@ -469,6 +435,17 @@ static int rts5228_extra_init_hw(struct rtsx_pcr=20
> *pcr)
>  	else
>  		rtsx_pci_write_register(pcr, PETXCFG, 0x30, 0x00);
>=20
> +	/*
> +	 * If u_force_clkreq_0 is enabled, CLKREQ# PIN will be forced
> +	 * to drive low, and we forcibly request clock.
> +	 */
> +	if (option->force_clkreq_0)
> +		rtsx_pci_write_register(pcr, PETXCFG,
> +				 FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_LOW);
> +	else
> +		rtsx_pci_write_register(pcr, PETXCFG,
> +				 FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_HIGH);
> +
>  	rtsx_pci_write_register(pcr, PWD_SUSPEND_EN, 0xFF, 0xFB);
>=20
>  	if (pcr->rtd3_en) {
> diff --git a/drivers/misc/cardreader/rts5249.c=20
> b/drivers/misc/cardreader/rts5249.c
> index 47ab72a43256..6c81040e18be 100644
> --- a/drivers/misc/cardreader/rts5249.c
> +++ b/drivers/misc/cardreader/rts5249.c
> @@ -86,64 +86,22 @@ static void=20
> rtsx_base_fetch_vendor_settings(struct rtsx_pcr *pcr)
>=20
>  static void rts5249_init_from_cfg(struct rtsx_pcr *pcr)
>  {
> -	struct pci_dev *pdev =3D pcr->pci;
> -	int l1ss;
>  	struct rtsx_cr_option *option =3D &(pcr->option);
> -	u32 lval;
> -
> -	l1ss =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
> -	if (!l1ss)
> -		return;
> -
> -	pci_read_config_dword(pdev, l1ss + PCI_L1SS_CTL1, &lval);
>=20
>  	if (CHK_PCI_PID(pcr, PID_524A) || CHK_PCI_PID(pcr, PID_525A)) {
> -		if (0 =3D=3D (lval & 0x0F))
> -			rtsx_pci_enable_oobs_polling(pcr);
> -		else
> +		if (rtsx_check_dev_flag(pcr, ASPM_L1_1_EN | ASPM_L1_2_EN
> +				| PM_L1_1_EN | PM_L1_2_EN))
>  			rtsx_pci_disable_oobs_polling(pcr);
> +		else
> +			rtsx_pci_enable_oobs_polling(pcr);
>  	}
>=20
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_1)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_2)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_2_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_1)
> -		rtsx_set_dev_flag(pcr, PM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_2)
> -		rtsx_set_dev_flag(pcr, PM_L1_2_EN);
> -
>  	if (option->ltr_en) {
> -		u16 val;
> -
> -		pcie_capability_read_word(pdev, PCI_EXP_DEVCTL2, &val);
> -		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
> -			option->ltr_enabled =3D true;
> -			option->ltr_active =3D true;
> +		if (option->ltr_enabled)
>  			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
> -		} else {
> -			option->ltr_enabled =3D false;
> -		}
>  	}
>  }
>=20
> -static int rts5249_init_from_hw(struct rtsx_pcr *pcr)
> -{
> -	struct rtsx_cr_option *option =3D &(pcr->option);
> -
> -	if (rtsx_check_dev_flag(pcr, ASPM_L1_1_EN | ASPM_L1_2_EN
> -				| PM_L1_1_EN | PM_L1_2_EN))
> -		option->force_clkreq_0 =3D false;
> -	else
> -		option->force_clkreq_0 =3D true;
> -
> -	return 0;
> -}
> -
>  static void rts52xa_force_power_down(struct rtsx_pcr *pcr, u8=20
> pm_state, bool runtime)
>  {
>  	/* Set relink_time to 0 */
> @@ -276,7 +234,6 @@ static int rts5249_extra_init_hw(struct rtsx_pcr=20
> *pcr)
>  	struct rtsx_cr_option *option =3D &(pcr->option);
>=20
>  	rts5249_init_from_cfg(pcr);
> -	rts5249_init_from_hw(pcr);
>=20
>  	rtsx_pci_init_cmd(pcr);
>=20
> @@ -327,11 +284,12 @@ static int rts5249_extra_init_hw(struct=20
> rtsx_pcr *pcr)
>  		}
>  	}
>=20
> +
>  	/*
>  	 * If u_force_clkreq_0 is enabled, CLKREQ# PIN will be forced
>  	 * to drive low, and we forcibly request clock.
>  	 */
> -	if (option->force_clkreq_0 && pcr->aspm_mode =3D=3D ASPM_MODE_CFG)
> +	if (option->force_clkreq_0)
>  		rtsx_pci_write_register(pcr, PETXCFG,
>  			FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_LOW);
>  	else
> diff --git a/drivers/misc/cardreader/rts5260.c=20
> b/drivers/misc/cardreader/rts5260.c
> index 79b18f6f73a8..d2d3a6ccb8f7 100644
> --- a/drivers/misc/cardreader/rts5260.c
> +++ b/drivers/misc/cardreader/rts5260.c
> @@ -480,47 +480,19 @@ static void rts5260_pwr_saving_setting(struct=20
> rtsx_pcr *pcr)
>=20
>  static void rts5260_init_from_cfg(struct rtsx_pcr *pcr)
>  {
> -	struct pci_dev *pdev =3D pcr->pci;
> -	int l1ss;
>  	struct rtsx_cr_option *option =3D &pcr->option;
> -	u32 lval;
> -
> -	l1ss =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
> -	if (!l1ss)
> -		return;
> -
> -	pci_read_config_dword(pdev, l1ss + PCI_L1SS_CTL1, &lval);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_1)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_2)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_2_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_1)
> -		rtsx_set_dev_flag(pcr, PM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_2)
> -		rtsx_set_dev_flag(pcr, PM_L1_2_EN);
>=20
>  	rts5260_pwr_saving_setting(pcr);
>=20
>  	if (option->ltr_en) {
> -		u16 val;
> -
> -		pcie_capability_read_word(pdev, PCI_EXP_DEVCTL2, &val);
> -		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
> -			option->ltr_enabled =3D true;
> -			option->ltr_active =3D true;
> +		if (option->ltr_enabled)
>  			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
> -		} else {
> -			option->ltr_enabled =3D false;
> -		}
>  	}
>  }
>=20
>  static int rts5260_extra_init_hw(struct rtsx_pcr *pcr)
>  {
> +	struct rtsx_cr_option *option =3D &pcr->option;
>=20
>  	/* Set mcu_cnt to 7 to ensure data can be sampled properly */
>  	rtsx_pci_write_register(pcr, 0xFC03, 0x7F, 0x07);
> @@ -539,6 +511,17 @@ static int rts5260_extra_init_hw(struct rtsx_pcr=20
> *pcr)
>=20
>  	rts5260_init_hw(pcr);
>=20
> +	/*
> +	 * If u_force_clkreq_0 is enabled, CLKREQ# PIN will be forced
> +	 * to drive low, and we forcibly request clock.
> +	 */
> +	if (option->force_clkreq_0)
> +		rtsx_pci_write_register(pcr, PETXCFG,
> +				 FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_LOW);
> +	else
> +		rtsx_pci_write_register(pcr, PETXCFG,
> +				 FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_HIGH);
> +
>  	rtsx_pci_write_register(pcr, pcr->reg_pm_ctrl3, 0x10, 0x00);
>=20
>  	return 0;
> diff --git a/drivers/misc/cardreader/rts5261.c=20
> b/drivers/misc/cardreader/rts5261.c
> index 94af6bf8a25a..67252512a132 100644
> --- a/drivers/misc/cardreader/rts5261.c
> +++ b/drivers/misc/cardreader/rts5261.c
> @@ -454,54 +454,17 @@ static void rts5261_init_from_hw(struct=20
> rtsx_pcr *pcr)
>=20
>  static void rts5261_init_from_cfg(struct rtsx_pcr *pcr)
>  {
> -	struct pci_dev *pdev =3D pcr->pci;
> -	int l1ss;
> -	u32 lval;
>  	struct rtsx_cr_option *option =3D &pcr->option;
>=20
> -	l1ss =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
> -	if (!l1ss)
> -		return;
> -
> -	pci_read_config_dword(pdev, l1ss + PCI_L1SS_CTL1, &lval);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_1)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_1_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, ASPM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_ASPM_L1_2)
> -		rtsx_set_dev_flag(pcr, ASPM_L1_2_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, ASPM_L1_2_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_1)
> -		rtsx_set_dev_flag(pcr, PM_L1_1_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, PM_L1_1_EN);
> -
> -	if (lval & PCI_L1SS_CTL1_PCIPM_L1_2)
> -		rtsx_set_dev_flag(pcr, PM_L1_2_EN);
> -	else
> -		rtsx_clear_dev_flag(pcr, PM_L1_2_EN);
> -
> -	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, 0xFF, 0);
>  	if (option->ltr_en) {
> -		u16 val;
> -
> -		pcie_capability_read_word(pdev, PCI_EXP_DEVCTL2, &val);
> -		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
> -			option->ltr_enabled =3D true;
> -			option->ltr_active =3D true;
> +		if (option->ltr_enabled)
>  			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
> -		} else {
> -			option->ltr_enabled =3D false;
> -		}
>  	}
>  }
>=20
>  static int rts5261_extra_init_hw(struct rtsx_pcr *pcr)
>  {
> +	struct rtsx_cr_option *option =3D &pcr->option;
>  	u32 val;
>=20
>  	rtsx_pci_write_register(pcr, RTS5261_AUTOLOAD_CFG1,
> @@ -547,6 +510,17 @@ static int rts5261_extra_init_hw(struct rtsx_pcr=20
> *pcr)
>  	else
>  		rtsx_pci_write_register(pcr, PETXCFG, 0x30, 0x00);
>=20
> +	/*
> +	 * If u_force_clkreq_0 is enabled, CLKREQ# PIN will be forced
> +	 * to drive low, and we forcibly request clock.
> +	 */
> +	if (option->force_clkreq_0)
> +		rtsx_pci_write_register(pcr, PETXCFG,
> +				 FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_LOW);
> +	else
> +		rtsx_pci_write_register(pcr, PETXCFG,
> +				 FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_HIGH);
> +
>  	rtsx_pci_write_register(pcr, PWD_SUSPEND_EN, 0xFF, 0xFB);
>=20
>  	if (pcr->rtd3_en) {
> diff --git a/drivers/misc/cardreader/rtsx_pcr.c=20
> b/drivers/misc/cardreader/rtsx_pcr.c
> index a3f4b52bb159..a30751ad3733 100644
> --- a/drivers/misc/cardreader/rtsx_pcr.c
> +++ b/drivers/misc/cardreader/rtsx_pcr.c
> @@ -1326,11 +1326,8 @@ static int rtsx_pci_init_hw(struct rtsx_pcr=20
> *pcr)
>  			return err;
>  	}
>=20
> -	if (pcr->aspm_mode =3D=3D ASPM_MODE_REG) {
> +	if (pcr->aspm_mode =3D=3D ASPM_MODE_REG)
>  		rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, 0x30, 0x30);
> -		rtsx_pci_write_register(pcr, PETXCFG,
> -				FORCE_CLKREQ_DELINK_MASK, FORCE_CLKREQ_HIGH);
> -	}
>=20
>  	/* No CD interrupt if probing driver with card inserted.
>  	 * So we need to initialize pcr->card_exist here.
> @@ -1345,7 +1342,9 @@ static int rtsx_pci_init_hw(struct rtsx_pcr=20
> *pcr)
>=20
>  static int rtsx_pci_init_chip(struct rtsx_pcr *pcr)
>  {
> -	int err;
> +	struct rtsx_cr_option *option =3D &(pcr->option);
> +	int err, l1ss;
> +	u32 lval;
>  	u16 cfg_val;
>  	u8 val;
>=20
> @@ -1430,6 +1429,48 @@ static int rtsx_pci_init_chip(struct rtsx_pcr=20
> *pcr)
>  			pcr->aspm_enabled =3D true;
>  	}
>=20
> +	l1ss =3D pci_find_ext_capability(pcr->pci, PCI_EXT_CAP_ID_L1SS);
> +	if (l1ss) {
> +		pci_read_config_dword(pcr->pci, l1ss + PCI_L1SS_CTL1, &lval);
> +
> +		if (lval & PCI_L1SS_CTL1_ASPM_L1_1)
> +			rtsx_set_dev_flag(pcr, ASPM_L1_1_EN);
> +		else
> +			rtsx_clear_dev_flag(pcr, ASPM_L1_1_EN);
> +
> +		if (lval & PCI_L1SS_CTL1_ASPM_L1_2)
> +			rtsx_set_dev_flag(pcr, ASPM_L1_2_EN);
> +		else
> +			rtsx_clear_dev_flag(pcr, ASPM_L1_2_EN);
> +
> +		if (lval & PCI_L1SS_CTL1_PCIPM_L1_1)
> +			rtsx_set_dev_flag(pcr, PM_L1_1_EN);
> +		else
> +			rtsx_clear_dev_flag(pcr, PM_L1_1_EN);
> +
> +		if (lval & PCI_L1SS_CTL1_PCIPM_L1_2)
> +			rtsx_set_dev_flag(pcr, PM_L1_2_EN);
> +		else
> +			rtsx_clear_dev_flag(pcr, PM_L1_2_EN);
> +
> +		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &cfg_val);
> +		if (cfg_val & PCI_EXP_DEVCTL2_LTR_EN) {
> +			option->ltr_enabled =3D true;
> +			option->ltr_active =3D true;
> +		} else {
> +			option->ltr_enabled =3D false;
> +		}
> +
> +		if (rtsx_check_dev_flag(pcr, ASPM_L1_1_EN | ASPM_L1_2_EN
> +				| PM_L1_1_EN | PM_L1_2_EN))
> +			option->force_clkreq_0 =3D false;
> +		else
> +			option->force_clkreq_0 =3D true;
> +	} else {
> +		option->ltr_enabled =3D false;
> +		option->force_clkreq_0 =3D true;
> +	}
> +
>  	if (pcr->ops->fetch_vendor_settings)
>  		pcr->ops->fetch_vendor_settings(pcr);
>=20
> --
> 2.25.1
>=20
>>  -----Original Message-----
>>  From: Greg KH <gregkh@linuxfoundation.org>
>>  Sent: Tuesday, September 19, 2023 3:06 PM
>>  To: Ricky WU <ricky_wu@realtek.com>
>>  Cc: Linux regressions mailing list <regressions@lists.linux.dev>;=20
>> Paul
>>  Grandperrin <paul.grandperrin@gmail.com>; stable@vger.kernel.org;
>>  Wei_wang <wei_wang@realsil.com.cn>; Roger Tseng
>>  <rogerable@realtek.com>; Linus Torvalds=20
>> <torvalds@linux-foundation.org>
>>  Subject: Re: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
>>  drivers/misc/cardreader breaks NVME power state, preventing system=20
>> boot
>>=20
>>=20
>>  External mail.
>>=20
>>=20
>>=20
>>  On Tue, Sep 19, 2023 at 02:20:53AM +0000, Ricky WU wrote:
>>  > Hi Greg k-h=EF=BC=8C
>>  >
>>  > In order to cover the those platform Power saving issue, our=20
>> approach
>>  > on new patch will be different from the previous patch
>>  (101bd907b4244a726980ee67f95ed9cafab6ff7a).
>>  >
>>  > So we need used fixed Tag on
>>  101bd907b4244a726980ee67f95ed9cafab6ff7a
>>  > or a new patch for this problem?
>>=20
>>  I'm sorry, but I do not understand.  I think a new change is needed=20
>> here, right?
>>  Or are you wanting a different commit backported to stable trees? =20
>> What
>>  about Linus's tree now?
>>=20
>>  What exactly should I do here?
>>=20
>>  confused,
>>=20
>>  greg k-h


