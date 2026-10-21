Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.67.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572049;
	b=H69VeZKVAW6is3NG4fajm9t/qfpHVc4+qaYu0h4p9T0dKiOsplzBMACRdb99GFla1M/7
	 38gV8vd0PjQY2W5HIwZR0fxHgmVD3ryJkM3rOeLXcTwQG5Cxa0rp6c5iBcEWECVGq24+r
	 MIUqv4D/EyGJ2+KqQKlPisuCt7TkLhD0eW1by7WHrP38IPvMS0ZU7FJYSaNqeLLvrrEqT
	 knUIcPhVel7X8D5RDBvGLVzzZiu8VQJIg65IOHnwoTkZsHoCkU6lr+Il15npwQkQDoSH/
	 kiN59FvktGvq8okZSHpUx/jXAspI7xH47SMrR1mge9qhLrJEDYbQQ47wGimmDelBVJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572049;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Authority-Info-Out:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=zdXenTAP4aTDxopwPgC1bDuShGvFSbnCGAsyhatJnPI=;
	b=dezupQr20OPyVwrhjBn7wFPlsxHw/Q/D/bk8s4a5JCyKnqFko/EvgYbYFVlQUaqicGfw
	 zD7BPhwwHBoUdCRhoJhQee052mAUcWgXnyZGFMj3XAS6EVmrEkkSogWmH9+Ol3E3Ldp+G
	 Hfr7TrwLfgxpGQY6pgZHGILfawzby6m/e8IaPo06wGpSR/Fe00/HNNjZ03so5UduSSDn/
	 7gkJDHDeNZ8QjJSFc5yVJfTJfKuVI4A1FUErpiWNE9ndW9kcmPhGRWyhckOWve00jRTNx
	 j672xhNeRwziPHtEKs7j1ESJuB81KKRHsbnNWk0O6MXStkT9wy+6ZjRzd/bRuVKMoIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=yRAL5zln;
	arc=none smtp.remote-ip=57.103.67.63
Received: from outbound.pv.icloud.com (pv-2006d-snip4-11.eps.apple.com [57.103.67.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533B606AB26
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 08:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C533B606AB26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=yRAL5zln
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-8 (Postfix) with ESMTPS id 486FE1800126;
	Wed, 21 Oct 2026 08:40:46 +0000 (UTC)
X-ICL-RepId: 01a15d9e-bb85-7eec-8c33-319b2c9ddbe3
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQFIHV8EWxxCDFYCVARLVxQEHVcaVhlWHVgUWgYOXnIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXAdLWhVVFw4CQh9QH0wWV0NHHRwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoCURxWDVdDVARfUFQRV1ALDQJECkoAD1RcBRQOHQVYVAkLSQBLBVsGXlAWXRkKCQ8OVhMASAQMUkVREVQdXy1eCF4fTBwdDlgGDFBNAUMICgJRHFYNVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792572048; x=1824108048; bh=zdXenTAP4aTDxopwPgC1bDuShGvFSbnCGAsyhatJnPI=; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version:x-icloud-hme; b=yRAL5zln73JAt0W8/20SSF+zcJemLYKLlBGZlmZAOBeRoRfFOkVzmD+t4TgyQf+UsP99e9NevaIqfrqXqm7PfeiLANLox8srJMoQ+j8whQyM4HgZxDw0DCey51SEmtsZRKLCeuSqCKwbcPz7wUf85yhTOl76EnR3pDV2IW7IhDbw6W3DBw105VMeIPyniDKxoclb4GDnG83FutVCNLbPl3MCVMNQF4dM3zZ3PJ4vbGy8QRLNLUWMgf88xNcXQCVZ0uCpWpJSSxjW02PASqFiDKx/OTVh5PLbfOxXO25pqb5PVgt7D/CdJip0lEfJBUOB89c/8sHiPX2SeT629Yb+hw==
Received: from archlinux.lan (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-8 (Postfix) with ESMTPSA id 9000618001F3;
	Wed, 21 Oct 2026 08:40:42 +0000 (UTC)
Message-ID: <f04323bc77d7e65cb99936615bfda9d8edc907ae.camel@icloud.com>
Subject: Re: [PATCH v3] PCI: Skip Target Speed quirk on clamped ports with
 no link
From: Edward Malik <edwardmalik95@icloud.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Andreas Wild
	 <andiwild@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Bjorn Helgaas
 <helgaas@kernel.org>,  Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, M M <restafvalendergelijke@outlook.com>, blaat
 windows <blaaaat@hotmail.com>
Date: Wed, 21 Oct 2026 11:40:36 +0300
In-Reply-To: <f9ab8a2d-966f-4e96-b905-116919c5ac7b@leemhuis.info>
References: <20260801201244.4421-1-andiwild@gmail.com>
		 <20260917233355.GA1115024@bhelgaas>
		 <b4ed1637-ac6a-4af5-ab47-e07309af200b@leemhuis.info>
		 <alpine.DEB.2.21.2609181131520.57799@angie.orcam.me.uk>
		 <1b2cceea-8da4-4239-a955-e0c6b475a227@leemhuis.info>
		 <87c93553-d74d-4588-bd54-0ccb2728f327@leemhuis.info>
		 <20260929080109.53944-1-andiwild@gmail.com>
		 <c5ee9a34c6b7d3ca96538c9cc2914b603b0dce7e.camel@icloud.com>
		 <f9ab8a2d-966f-4e96-b905-116919c5ac7b@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (by Flathub.org) 
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Authority-Info-Out: v=2.4 cv=D8dK6/Rj c=1 sm=1 tr=0 ts=6ad87a8f
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=U1xsJXor1XMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=afFvrsou0sv1YYiRHQ8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _iWiAIllxwHZg1jfbo2O1YqpAJvd2OYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX+vZm8hIiNA5W
 3DXIik1b3I97Pknjy2dn08/UEg+RWRxHGzhKXNnWv5Q1HYHAZippxwcFuIznfzDlU6kSSdMQ9Ht
 jwSdGW0C+AquAd5lU0KSsaTauIVr194IS8VoCKkKOZ+nMJjp7OK1qOMH9ruZ9LKXsWC8WHKKNit
 4wmlVraSXOMSbpvj/FuxhgtI+D59b0CfXURML5B0yVrzpjag/3nq2vuW6dQOdMWrNPRyDEsxmxU
 xEPFg7WhVkYSZGqbcHSSGgxCxVqh8Io8XtypFDdr0+FcVRJgdgn4+XXm4Wx1WLhF31Mi9E8XEZT
 WxFVdIfgWfSzEeNwwSqMP7rzbiRXvgM7uaEXzqCLVeDDCRXhYTYYz/eJ+HyOJ8=
X-Proofpoint-ORIG-GUID: _iWiAIllxwHZg1jfbo2O1YqpAJvd2OYB
X-JNJ: AAAAAAAB9se2MXJ4DacDVdVP8P9YdpiYLkiQH7goHZ8V1bVLwEESnURcMy38c9dyAAm5cvFE2WBz6yRbOOzpMQbCDXLKaMfMlonQlgKGS5Fj1nk9S8sIOFEhHGEoB0l+4HCWHC2E6CECyVbZd0eXTbZk00fFm6MGAxBhX+TblfKqyx3iItQeptIoxU3zr1tncQIP8TIzo7Txn7YGZcbjdaZHRc/74CEw1fz6FQZLKvpNMiF6xf/zSZrVPBBuKmkYAGlTify8BMT3Gf2dgN3+BPF0p3065p8Ip2bdzr7+jkQdAMIbay/7S1CgodkNysHrIvr91t8ecIbSEpW0UsCLDGzJEgKluB7CLnlM3fyckWVqDYsX97mK0aiuFzdeuCnWweCvmeWFEnkxFHAK4+Pb4fpw5HsI7P9JBaPODNYnJNL1ccL1M8xG2k4iDXM1ssvzwsGJFPLXuG6XNwuTmuyaKZpFMrYQsOWR122dMLTyyJeQzp1lvoC2mgynnhODBElhaLDE5+WIqUT+/AM4P1hKtNNVGkrqtTmN7IjQBSiD7lsD0Cw4VSZ5dBffiha8h6uyueyPIHGFuIYWhrdtNyWIM79lV9Ijfm4uskGICDP80nACEeCSa9tHTRL0h0iFwdeUbvLZkuzsPHu8PnXuSmspfaianUNjdDK2IdFUCxMXX2jFBBmVA1AH0ubh1wGLMvqymxO+YYQuBqYsnAf6QQz6jfEYa+UHnhrxvHkq8r+VBgO9kfqnSg7mw/TCMKqeGoZ1FQ7gJqna64HzD1ohzqx4J6dk+yr7o3tkqHLZK++AzcLnuAvTla40aCAIR+ckZMNpssMMULr2fA35F2ruFr8SPkEUc8qU/k0im0cKe2LvLrtI6ygo9/eQ+Wxq2tjnamFNeFdbFhuO5TkfeBnBvsBVITeZDD5OjG0+zmXBQFlj7E8lwGZ82W7VIW9yWqwl48PSVKmEleI5khKhOnDbpsXXDhG7uXuU/3J
 DbwQWfOpKJ6Y/VTJ5AcYqPnMjfJO1yIdDVpXAWf7nNgnriU2mk/CTRZetBxfXHcDcEfLBmKFSK0s6fb484xy49kFpesprCt2Irga9tACXSvhgq846jfFfEjbrt0gcZXwLG3sbPh2GuPtFffQAOIbJNGVjucIooJe7rmyvAVCTUK73MfpAoge95dfAP3ZZK70Dbu4mUlhjWTwz902WVdk+1Yf1vwFJ6z4xKDSUp3H+R/na2uSDfiqNhi8oIEIaXnOeM8e7uWVxD4b7MLLJSeGTa68MDpKYb40T12bbe+Lnkob3u1sZQ3raS4giMDBMH9BUDcxHIsFmomZKYDN986EABOOIqeg/h79+Gvo9/q03YjWTB+EwnMYAcVkWeW7KCcwZ6LFUIBEWaDJAaXx2cmgY

On Wed, 2026-10-21 at 10:24 +0200, Thorsten Leemhuis wrote:
>=20
> I don't known about the others, but if you ask me this thread always
> was
> confusing, as we ended up discussing two different problems; over
> time
> it became even more confusing.=C2=A0 And one of the issues was fixed for
> 7.3
> iirc.
>=20
> So if you ask me I think it's overdue someone tests if *vanilla* 7.3

well i can test it from the masters build how would i go about making a
new thread this is my first time usig the mailing system i make a new
thread on bugzilla and cc the people in this thread ? also can you
bring me up to speed which issue got fixed in 7.3 ?=20
