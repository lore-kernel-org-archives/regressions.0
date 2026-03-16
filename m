Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621033B6F8
	for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683958; cv=none; b=BpqLvZjvz7nJE8R0QR5QE6MUGDS5/PSgcfwtVbOown2wEobIFqZoH1OC2QlVBlVtqzkGQDH4dJuPtmn2b0NgICBsi/z8rUCU6oYz/cXp4QMc0M4zf6E3a8OM33h4Pz3cKK92eZwFs1gnE0uFz8LYMgm5sDh8cvbEJl0dAFl3jns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683958; c=relaxed/simple;
	bh=y5avfKnjh41/JWQRZgxs/uL4wWWciPPQDolHRgDT7YE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHO+vxqdSprC+j+zZn9WtW8Dp7f0p9kvZA+J21z2estcOPSm0qkTmjwE2JkCUzporpB6r+g/VX2hStC269befQV5wuftp9DP5ZhTQk8usheXJwRXkbww1rrNajGY3ilgqL9dOTDTuDzF1nvSW4LjO0sL6NK0G7PynBITBui5QQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=xuqN7aXW; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xuqN7aXW"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8cd81963e73so526246885a.2
        for <regressions@lists.linux.dev>; Mon, 16 Mar 2026 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773683955; x=1774288755; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y5avfKnjh41/JWQRZgxs/uL4wWWciPPQDolHRgDT7YE=;
        b=xuqN7aXWRtyk5h5Wo/lQpYMXOJckIZYXAhTkTlSpKaiL0QoCsHLUxh3Nin+mzjEMWT
         DUJUARK7uDh9pfG/Egi7ZxaypT2GN5pPNAsxUvn/Zt5kKMYDE2q2d/GFCTfIHQ46S255
         OP0jiK2sizxzuIvQ+XQLQxJQaaamo9D4LXcnMN1tqazavhLu7qCjkFertmiQkOuyFoX9
         SY+NptwBa4ftU1+0G8mBAsL+VjbaPmcoKz1qdiYGybRQZ4AOacwDWkGdcGPX7YLdYb3u
         1T/st9yxH5aYa1XrsH8cjr3rjF7o/j+RsgEDJTElRkFjRv2MtRqpNMRoYO2lwU3/jcas
         L13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773683955; x=1774288755;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5avfKnjh41/JWQRZgxs/uL4wWWciPPQDolHRgDT7YE=;
        b=RcKfwJ9sn2oDa+iEKYmIoH6lfIyh8UetbQDz5YJb+bvgYdpXz5jSBncq01Y0zvWfSX
         R1ksEIR8CpK7GEsNn1pfJRwBoddB4LIYPME3bliNN+RZwxhaIO5xX9wND92tAi8/qjqL
         Kh/09ZRFSSADriDBu9uLSewAfXuGO1niM0YKI7y4F+1oKW9AFboThywRbaopyIdiJed4
         CP2A2DWNyZsEEOmiyNRqD5AxeF0Zpa8yw6nDOccE+YqfkhmThROf55L4c68tXa8esOch
         oqw5tvWMvXjlc3HdaVYHPIRYRxq+MJAIThE5FMxJecv8axpvv5QfV9TEnOpD/fIxn4fE
         9wTA==
X-Forwarded-Encrypted: i=1; AJvYcCWEx56pI04Nt08WqouYTyU0SgCIRR5DE/RtXu4tC8HL7v1Bg6jAnDi8hE8vNLi+oeR0TyAd9hQRNkuSkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOCBrn4vj5wLQbr6brApqeiDzrwa7i7Ia0/l6VtYIQ8Alt9rvE
	Tt5bnUQJnP+Kk8fiiccs2zrmb8rGuuuCfeJs0EZAgv1PXR5tHLXRv6CNbMZCXiuXex8=
X-Gm-Gg: ATEYQzw05Ll6XjoFwcsrlue5imjirs41EA0Jko9yyCv2eS8V6J4aGQ3pM+Jk5Rt2C1g
	zdbay1q6pSQy7OKe/6hHMYT66QdIdTRmMxfB4GIdVwSv0YUC6Fqf6BuggPC6ZQvYzohvJB0ALSj
	MES6Jvryy479S/LzXL+7u6P4U7acTdXq3mPI1KajP4ex07RKgA7jxifC12AnUth6fqig4u56ec+
	jAIywfrygAM2ghthjPhVo/pBXj5rPgMDEhfy+oKUUextUd14h+r+ameLpglfHKgI8CJ+XQNQU41
	Qe0snVv+q2TK+8L9ylUiw6HPXjDbJdG7HL1/FDi71dhaEL+IXbStqme9jZVC0e7ZlmbmQDp6NpF
	mKB7Ktv0Z0HbT+cNIK1BJ60oPDz+jD38RB5qTGZ7Jy2KCAY1dJceqDKQOC5TBKrT+mi1ijoi+S7
	s+yQFSbLGoN8U0qI2UmFHqhdg3B6yo
X-Received: by 2002:a05:620a:4713:b0:8cd:9aba:f5fb with SMTP id af79cd13be357-8cdb5aa56famr1781220785a.30.1773683954881;
        Mon, 16 Mar 2026 10:59:14 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21484casm1257452685a.40.2026.03.16.10.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:59:14 -0700 (PDT)
Message-ID: <56de4e9b3478a576475e0d246904b20da417c69a.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: ming.qian@oss.nxp.com, linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
 devicetree@vger.kernel.org, 	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev
Date: Mon, 16 Mar 2026 13:59:12 -0400
In-Reply-To: <20260316155727.GA43134@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
	 <20260312173349.GA137045@francesco-nb>
	 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
	 <20260316155727.GA43134@francesco-nb>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hJdAk5mQN9OAKDcOs1p8"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-hJdAk5mQN9OAKDcOs1p8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 16 mars 2026 =C3=A0 16:57 +0100, Francesco Dolcini a =C3=A9crit=C2=
=A0:
> On Mon, Mar 16, 2026 at 11:25:53AM -0400, Nicolas Dufresne wrote:
> > Le jeudi 12 mars 2026 =C3=A0 18:34 +0100, Francesco Dolcini a =C3=A9cri=
t=C2=A0:
> > > Hello,
> > >=20
> > > On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com=C2=A0=
wrote:
> > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > >=20
> > > > Fix a kernel panic when probing the driver as a module:
> > > >=20
> > > > =C2=A0 Unable to handle kernel paging request at virtual address
> > > > =C2=A0 ffffd9c18eb05000
> > > > =C2=A0 of_find_matching_node_and_match+0x5c/0x1a0
> > > > =C2=A0 hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> > > >=20
> > > > The imx8mq_vpu_shared_resources array is referenced by variant
> > > > structures through their shared_devices field. When built as a
> > > > module, __initconst causes this data to be freed after module
> > > > init, but it's later accessed during probe, causing a page fault.
> > > >=20
> > > > The imx8mq_vpu_shared_resources is referenced from non-init code,
> > > > so keeping __initconst or __initconst_or_module here is wrong.
> > > >=20
> > > > Drop the __initconst annotation and let it live in the normal .roda=
ta
> > > > section.
> > > >=20
> > > > A bug of __initconst called from regular non-init probe code
> > > > leading to bugs during probe deferrals or during unbind-bind cycles=
.
> > > >=20
> > > > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> > > > Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc4=
41e66@kernel.org/
> > > > Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so=
62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> > > > Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while =
decoding H.264 and HEVC")
> > > > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm=
.com>
> > > > Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > >=20
> > > What's the plan to merge this? It fixes a quite severe regression,
> > > a boot failure.
> >=20
> > To be decided this week. The commit message does not say if it was rele=
ased, or
> > came in RCs (and I didn't check myself yet). I'd say, if its the first =
one, it
> > will go through next and backports, otherwise its is really tight to ge=
t that
> > into the RC series, but serious enough. Please fill the gap if you have=
 time,
> > and I'll handle it later, probably tomorrow.
>=20
> This fixes commit e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error
> while decoding H.264 and HEVC"), that was merged in 7.0-rc1.
>=20
> As of now, because of that, 7.0-rc is not booting on affected platforms
> (i.MX8MP), to me this needs to get merged before 7.0 is released.

Thanks for the info (thanks Thorsten too, pointing out it got picked for
backport into 6.19). This saves me a bit of time, I was away all week last =
week.

So this will be picked for RC, I should have it sent to Mauro by tomorrow.

regards,
Nicolas

--=-hJdAk5mQN9OAKDcOs1p8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabhE8AAKCRDZQZRRKWBy
9AjoAQC6Fq8nqFrDJHKmYMEmzqQfCe3plFtnxVAGHFpFY/s7owD/TGsDX0oH8gNo
OmK1Jt0VdfCP+LlxOL41kFaZW/vHqQU=
=61za
-----END PGP SIGNATURE-----

--=-hJdAk5mQN9OAKDcOs1p8--
