Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.85.9.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807756;
	b=Uke7hPf4SIBt5iRKABQ/DcWAhbZSGHvPangcfZIoiitJXYyMAtTNzeO4biKWxwMNxYVZ
	 HyEL9xLJswk2PvQKOb5eVtITpcKLhigjxom2M6RV+RjsEtqO+yng3IFQZG+zgi57grbDR
	 L4lSySDi+SOuR/1lN+A2ayUm5fSwHaGUvJEJBzhaXQXHucbe+0eKXV041pDZpyt3pFIG/
	 dEEsdmDOMCuxpQ98V0rtl8n5s3nRScoZTYWx5O2+OKeaQqKD4JgwJcrvyYvS/epqReKZa
	 kiiroFJCq73dx2dnfF0qDzqPmvCfEKcCDfzGtLK8t0BnHVRe8X1HcUQzt65t3s9lpmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807756;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=p0dbpZxKDZjwc5Ue6sP7ZQyfRddfvPs1oTGO/ZNaY0k=;
	b=FQnp293ipu9bGgy8OvJUQb6B/ZF1atNM5sjV0TbAPvB5EaQVxZz6hDtyAC2jOxfZcOGG
	 L7omao6c/gaBiUZovQQ3Tlo8ZYGrEIsrxfqFN4INXdyYmpxxG2VdIzu/HmZuYhlI24mOx
	 SSDKjZDb4MnQWa9zf+pnZ9iPX3PSxeB4NHB0Kf8JW1DHOKPOIUmVUPPFw1LYd3GReE4g2
	 ePywN6gmqg9d5QPEkeJuIxkNCtsjSlcBG5wBt+CtOcIcvNuPUKakg7R1tP5xwpCp1oxsW
	 oTeowC6ErjePvK0Ks+iBOps3rL2OtwKFJtC+c+7OT5j+KOi8tDheMCszA1gvsDs4Tlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=irl.hu;
	spf=pass smtp.mailfrom=irl.hu;
	arc=none smtp.remote-ip=95.85.9.111
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id D2D13606A31B
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 15:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D13606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69268.dsl.pool.telekom.hu [::ffff:81.182.146.104])
  (AUTH: CRAM-MD5 soyer@irl.hu, SSL: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by irl.hu with ESMTPSA
  id 00000000000A0070.000000006AEB5583.0010455E; Wed, 04 Nov 2026 16:55:47 +0100
Message-ID: <7cd4c010f13ee085e3aa4396705b6b06ed58f7e1.camel@irl.hu>
Subject: Re: [PATCH] ALSA: hda/tas2781: Only accept CRC-less V1 data if all
 entries are valid
From: Gergo Koteles <soyer@irl.hu>
To: med.jebabli@gmail.com, regressions@lists.linux.dev
Cc: Cristian Castellano <cristian.castellano@icloud.com>,
  stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
  Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org,
  Thorsten Leemhuis <regressions@leemhuis.info>,
  Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
Date: Wed, 04 Nov 2026 16:55:36 +0100
In-Reply-To: <20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce@gmail.com>
References: <20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Mohamed,

On Tue, 2026-11-03 at 10:27 +0100, Mohamed Yassine Jebabli via B4 Relay
wrote:
> From: Mohamed Yassine Jebabli <med.jebabli@gmail.com>
>=20
> Commit 408249089c48 ("ALSA: hda/tas2781: Accept V1 calibration data
> without CRC") only checked the first device entry. On machines where
> the BIOS populates fewer entries than p->ndev, the remaining all-zero
> entries are applied and tas2781_cali_preproc() divides by zero on
> playback open.
>=20
> Accept CRC-less V1 data only if every expected entry is non-zero and
> self-consistent (R0 * 1/R0 close to 1.0), otherwise reject it as
> before.
>=20

...

> =20
> +/*
> + * V1 data without CRC is only trusted if every expected device has a
> + * populated, self-consistent entry: R0 (Q27) * 1/R0 (Q31) must be
> + * close to 1.0 in Q58.
> + */

Just out of curiosity, where do Q27, Q31, Q58 come from?
I couldn't find anything about these.

Thanks,
Gergo
