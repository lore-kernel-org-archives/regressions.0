Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.85.9.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494619;
	b=3zQhF6MIgLpOUpiJYJT1kS3rr9Z6xKw7JqWWJdRGTThbVpwihgZNvaMwjz2KtXQrmzK5
	 GiQdidWUH48xPBVxQX/jHh8209qVOatSrHzW1ULz3zaI1HLgrORtCQP1bB8fE0d6TctnQ
	 sQJY9pcuGZTSd807wrIn/y5ZNnNeRKgIaOBgbzK95wV+aH5HUXP4fJocVz75Z8p67aVHs
	 vNZE9U6opmtEcvOhnyTOaYCs2s47x7yv8qdyL1xQTfpUpAvKTd1FAK2e7Mk8vkSwHWgLZ
	 htrJt+I+/hoYck4sRk3jRUIGEgt0Q5VOuKr4A1vH6RZV8XfJzov6yoVUHd5pz7hky6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494619;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=BmLmIRXTRT6cun9WV23K9Y6TFiMIhvIIl7/j6XtjqH0=;
	b=UtqNYwZS3sCYv/EAoVLOPw3CTDpGienmNhlPZcLSnSw7N3qx4QIwaGFNtnX2tNVWyyGj
	 FIiJmhVDHRigU8kT7ywIC4YANJFhQfojVjF37QXuRZ3miHkhs/hnP5vo2AhodTfoyfsYr
	 puHK/B2CSsNdAPp8+pN2wN1XyuRSDL8vptYJA3MdWROpuhJVFwTv/uyR9VwyXIJgepKT/
	 j/kl3RoFGd8cGevy+nRGbNZ7vxIjDlOCPWBds5xHcBr95/LWLOlkmVF0PEdc2a/CnkhBM
	 GWykKbzFxNax7TIb2Jm3TDIMGX6pZcmXiE40jI88BwxdZK57BQPe0sp2pvl4QmCCzCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=irl.hu;
	spf=pass smtp.mailfrom=irl.hu;
	arc=none smtp.remote-ip=95.85.9.111
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id ECCBF606A31C
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 14:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECCBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b6855e.dsl.pool.telekom.hu [::ffff:81.182.133.94])
  (AUTH: CRAM-MD5 soyer@irl.hu, SSL: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by irl.hu with ESMTPSA
  id 00000000000C60CB.000000006AF5D092.000045AF; Thu, 12 Nov 2026 15:43:30 +0100
Message-ID: <504167422048bb8197a1ca3fac079cec9dea1ae7.camel@irl.hu>
Subject: Re: [PATCH] ALSA: hda/tas2781: Only accept CRC-less V1 data if all
 entries are valid
From: Gergo Koteles <soyer@irl.hu>
To: regressions@lists.linux.dev
Cc: med.jebabli@gmail.com,
  Cristian Castellano <cristian.castellano@icloud.com>,
  stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
  Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org,
  Thorsten Leemhuis <regressions@leemhuis.info>,
  Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
Date: Thu, 12 Nov 2026 15:43:20 +0100
In-Reply-To: <7cd4c010f13ee085e3aa4396705b6b06ed58f7e1.camel@irl.hu>
References: <20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce@gmail.com>
	 <7cd4c010f13ee085e3aa4396705b6b06ed58f7e1.camel@irl.hu>
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

Hi,

On Wed, 2026-11-04 at 16:55 +0100, Gergo Koteles wrote:
> Hi Mohamed,
>=20
> On Tue, 2026-11-03 at 10:27 +0100, Mohamed Yassine Jebabli via B4 Relay
> wrote:
> > From: Mohamed Yassine Jebabli <med.jebabli@gmail.com>
> >=20
> > Commit 408249089c48 ("ALSA: hda/tas2781: Accept V1 calibration data
> > without CRC") only checked the first device entry. On machines where
> > the BIOS populates fewer entries than p->ndev, the remaining all-zero
> > entries are applied and tas2781_cali_preproc() divides by zero on
> > playback open.
> >=20
> > Accept CRC-less V1 data only if every expected entry is non-zero and
> > self-consistent (R0 * 1/R0 close to 1.0), otherwise reject it as
> > before.
> >=20
>=20
> ...
>=20
> > =20
> > +/*
> > + * V1 data without CRC is only trusted if every expected device has a
> > + * populated, self-consistent entry: R0 (Q27) * 1/R0 (Q31) must be
> > + * close to 1.0 in Q58.
> > + */
>=20
> Just out of curiosity, where do Q27, Q31, Q58 come from?
> I couldn't find anything about these.
>=20
>=20

I think it would be good to be able to see which commits were generated
by an LLM. This way, people wouldn't have to scour the internet trying
to verify hallucinations. Furthermore, it would be possible to see what
percentage of the kernel consists of public domain/LLM code.

Best regards,
Gergo
