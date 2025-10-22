Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110A2BF005
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154243; cv=none; b=DEB0CXA8ZlrAn8IIt/sobxYtGD01K2VfrsiZ9sGoik1n4WTZjIxkrovvP7BaHDLc4je1SBaMGH1MfQMKEUs+hF36cOCzFnl0tg2+0MoHQim52/l241/ttEyy+HoCd5Sac37Sci2jAVlnAqdrEFBKfiGpqz6ujSSBwva7YOwzOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154243; c=relaxed/simple;
	bh=dhyaC0ICk5isf1JAQ07TmGyf/BAWBQbKFRNYZv3i8W0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aj4ex4yiJqGhqQ/y3ENHnICqp3m98kDla+nE242EAoraXQ3Shkxjq3bud53hUA0j3SpsvS08JAFu0TBBDY6aqYcaKSQBGIlikZa/lUmar3iujNsnuPzPn4aAMHCqx0zbyQKrTFdNPyTdpIWv42zMMR7CGcs+EYjw+ukyVFddVbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ql5ut9uj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql5ut9uj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso3282104f8f.2
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761154239; x=1761759039; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1nFCN9pLEfI7dNTPvL0mUSRHrfYXPoZtHDehAzFK4eA=;
        b=Ql5ut9ujm36Qk71i+0EHLCqayayPEKIdWpsmiX5eHpCjj0ag8ZrlaW1Xu0zkgdCCmt
         V6GOXeIlDoe9hndzpf71o063fHuzujuKyTMXUkjFOk2S4bYdwRVDSD+LqSr5dVsjAnXO
         3gNW8Vo8EYsAByHlv0uzLTc4iD9WI/Der6bZeYhdlDSnawKT9QOVmF8nDhM2c18okh2+
         4+oAPNsgZQWkX81llGS/PYy7nCVaLh/w+5DyB1SPr/JLnetXIXMMUOvHBcxFWHc0QfS4
         jjfj/iyrUA1hCzzAt4t68qDXHqwN/hro4e2tr0+g9fcV9frVnncW3o18Bkhi/Hyo6cL9
         6Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154239; x=1761759039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nFCN9pLEfI7dNTPvL0mUSRHrfYXPoZtHDehAzFK4eA=;
        b=jOaVI/fEDfYogtRaAjOLPckygbsjRlF847xE9nYl9S35RDUerB19YB6YmiYzIECEtg
         V5edz6x0CIHFj/RVHdLZwxGWvBRcp/E5fHsRf8t1p4pUKHKRyisrFDVjwddOE93mZnZ+
         pSx4k6aLeFtPuOEcLMSy9yak5Q4HCAcYUYlkt4joGMygOVw337nOZbTeCAOHvpuAeBIi
         xdkH5JNnvd2AeCriNImvgnldO6R2rfK/RtrR/JvS7oYhdhnxAB3HmagiTgUT7fvnU415
         wDU9DoEjAi6GCs92/VkEmCBGimjW1/3G72zxU1mWxuFHEbNEXVgj7rWKXaY8hcinI/Z8
         dtsA==
X-Forwarded-Encrypted: i=1; AJvYcCVeTmhO9+nBHKwM5x5JhUxo4nKzfaSeEDE5e2tYYg6eIKdOigVwv57CVPVVJ2PwgRKvMuPgGcdv5bRuCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmtIEbQnVObzZwZSN9pLjz6PIi2hnHGZbt/h7tugCSLCAPnGZ3
	zbibCZqQUoo3crlGvvCsY1mZ8hVSI+UkKY2ry+9+kIZEp3r9JDhYZudO
X-Gm-Gg: ASbGncs/B/bhNODSXODmSeJhbmO/VL218g1uYYfsUzw3OGnSgbVaxx9f1weHIjRpNEH
	2SUjB3wkd8JcSckNK926QNvY6QID/jA66W6F0Wjxx84t0YzbxC1U30MFnVOpF5ctcbqmxtetkyn
	3As3YGgdcwmMkwKYm5/zMFbf53HFAZ9dUWTug9cr1L7ch4pNdjzie4+flVQY2YAKt8ptOmz2T0K
	GR700xVLMmYOU6StPaXGUgW015HYWxBFYVIqPYLR0T76+yBtBjxNrPl+uwj4Ap8yETxSj/ij6s4
	84S6NpWdzIDnJwOw5v539x0j6kDusIpFEQkL9yYVmGGB2xD1raecPMktUHqt5PD4s3WjPoXdQJU
	ReYnkv4GKZ1Ip4q7LAGkA7VB1+towIYGjwA7N+jOPwIHytkx7VHde1wBLyPQ0+u1/Jwj9Pd76o6
	5r0R1jTj7dGkoEdPgy3uHVnguHPbHjzSr4utCDiFPK+TL18mJT+075a1kvRQ==
X-Google-Smtp-Source: AGHT+IGpzLyeFOtu3WGWo07Zjf+OlCN6M5eusYAHPhvOlsQ5WxNrnoYQLWAS9/q733puojsFm3TO7g==
X-Received: by 2002:adf:e19a:0:b0:427:613:7772 with SMTP id ffacd0b85a97d-42706137842mr12906996f8f.32.1761154239253;
        Wed, 22 Oct 2025 10:30:39 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:5a8f:8582:c21f:f389? ([2a02:168:6806:0:5a8f:8582:c21f:f389])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c56sm26280266f8f.18.2025.10.22.10.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:30:38 -0700 (PDT)
Message-ID: <68dd3d93509b627dbdf907332a703443f46aff6c.camel@gmail.com>
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson	
 <jeff.johnson@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, Kalle
 Valo	 <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	regressions@lists.linux.dev
Date: Wed, 22 Oct 2025 19:30:38 +0200
In-Reply-To: <5466e122-9143-482e-a9ab-7f956e19bf86@oss.qualcomm.com>
References: 
	<20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
	 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
	 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
	 <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
	 <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
	 <5466e122-9143-482e-a9ab-7f956e19bf86@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-10-22 at 16:00 +0800, Baochen Qiang wrote:
> Thank you Klaus, can you please try if below diff can fix this regression=
?
>=20
> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/=
ath/ath10k/ce.c
> index 7bbda46cfd93..1a981d333b5c 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -1256,6 +1256,19 @@ void ath10k_ce_per_engine_service(struct ath10k *a=
r, unsigned int
> ce_id)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(ath10k_ce_per_engine_service);
>=20
> +void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ath10k_ce *ce =3D ath10k_ce_=
priv(ar);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ath10k_ce_pipe *ce_state =3D=
 &ce->ce_states[ce_id];
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ce_state->recv_cb)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ce_state->recv_cb(ce_state);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ce_state->send_cb)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ce_state->send_cb(ce_state);
> +}
> +EXPORT_SYMBOL(ath10k_ce_per_engine_check);
> +
> =C2=A0/*
> =C2=A0 * Handler for per-engine interrupts on ALL active CEs.
> =C2=A0 * This is used in cases where the system is sharing a
> diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/=
ath/ath10k/ce.h
> index 27367bd64e95..9923530e51eb 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.h
> +++ b/drivers/net/wireless/ath/ath10k/ce.h
> @@ -255,6 +255,7 @@ int ath10k_ce_cancel_send_next(struct ath10k_ce_pipe =
*ce_state,
> =C2=A0/*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DCE Interrup=
t Handlers=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D*/
> =C2=A0void ath10k_ce_per_engine_service_any(struct ath10k *ar);
> =C2=A0void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int c=
e_id);
> +void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id);
> =C2=A0void ath10k_ce_disable_interrupt(struct ath10k *ar, int ce_id);
> =C2=A0void ath10k_ce_disable_interrupts(struct ath10k *ar);
> =C2=A0void ath10k_ce_enable_interrupt(struct ath10k *ar, int ce_id);
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 97b49bf4ad80..ce8e0c2fb975 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -1812,7 +1812,7 @@ void ath10k_pci_hif_send_complete_check(struct ath1=
0k *ar, u8 pipe,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (resources > (ar_pci->attr[pipe].src_nentries >> 1))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath10k_ce_per_engine_service(ar, pi=
pe);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath10k_ce_per_engine_check(ar, pipe=
);
> =C2=A0}
>=20
> =C2=A0static void ath10k_pci_rx_retry_sync(struct ath10k *ar)
>=20
>=20

Thanks for looking into this.
I applied that patch on top of current mainline, but unfortunately the resu=
lt is still the same:

[    6.094149] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mod=
e 0 reset_mode 0
[    6.241457] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043202ff sub 0000:0000
[    6.241476] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0=
 dfs 1 testmode 0
[    6.242901] ath10k_pci 0000:02:00.0: firmware ver 10.2.4-1.0-00047 api 5=
 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 35bd9258
[    6.309202] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[   12.509266] ath10k_pci 0000:02:00.0: wmi unified ready event not receive=
d
[   12.581057] ath10k_pci 0000:02:00.0: could not init core (-110)
[   12.587057] ath10k_pci 0000:02:00.0: could not probe fw (-110)

