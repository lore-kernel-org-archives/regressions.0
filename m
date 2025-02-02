Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E881ADF58
	for <regressions@lists.linux.dev>; Sun,  2 Feb 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738488700; cv=none; b=eo4U+6DcbHdozRqDRCulfM1Qfoeipq54BusB2nQ881xJLJl14lM7sKy8I9T+ERMZIsyGRMpQ5S8D+Ppp0DMs5a67aFBjXFaMe+UX9c5LBh0wz3raW32+As3xzGkfB4RBHKoie9frHom+5K4dlrczt6pkYJcZ4kVJ+WEFj07RWPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738488700; c=relaxed/simple;
	bh=NmrvxdzU+MQV4GnadywgkZ32wh2zvHFYd+mUzrkc+84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9klETjPbiFXuilg6//FsxSOO3CyZ7SDrSE0TK2NXGUpR7p4BI2XnohjoqdeI/QnAX79GbWRWsVFv9A7tbXdHCuYuMNf/kqnNeLaRs2AZtk16nu6kn+yiYZXFu6j6v+OKnrmDDxALoQj+fhQZDySk/K6QupQMqP3MnT6Jx3Iw3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=hGhiqB62; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="hGhiqB62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1738488696; x=1739093496; i=christian@heusel.eu;
	bh=NmrvxdzU+MQV4GnadywgkZ32wh2zvHFYd+mUzrkc+84=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hGhiqB628hSg7AJ6PX1usr46wUFW6JSSoI/Bp2QS712U+MqFADseBY7qGzsOSqZU
	 eKKwR/k9zZy9Rkir4k4ZbYK5/jR8nOPurDYeugU3RDP4+w5pL3FwQRKr0TUIP7jqa
	 UC3FiCbCK9TUskZcXH35eM4eHAPwgkw9MgaHhNQIkVFhv5TuMH/pDQum8qMUIoB3w
	 nSIuQucBOy1YSXbrYdK1mvT62vu/IkOBN+qJLQXVdoPPXmwDTnOudLTld/xI4Apfn
	 gTzfQQ82OytdGDswxfsDyxBm1lgtPXH9gSCKhM06Kzu4R4eMWdyz32m2T8XAxNUmc
	 L/ceV5iBRoA4NUuBWw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([85.201.80.150]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N3bb1-1tV4A301ad-011GSW; Sun, 02 Feb 2025 10:26:12 +0100
Date: Sun, 2 Feb 2025 10:26:11 +0100
From: Christian Heusel <christian@heusel.eu>
To: "Ahmed, Shehab Sarar" <shehaba2@illinois.edu>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: TCP Fast Retransmission Issue
Message-ID: <f86dd0f6-6a2e-40f3-b0be-d9816ccb20cc@heusel.eu>
References: <DS0PR11MB77682EBD149E7965F1D8E8F1FDEB2@DS0PR11MB7768.namprd11.prod.outlook.com>
 <DS0PR11MB7768A5B80C9BF2366CFEC89BFDEB2@DS0PR11MB7768.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="25a2463gtnrp5jed"
Content-Disposition: inline
In-Reply-To: <DS0PR11MB7768A5B80C9BF2366CFEC89BFDEB2@DS0PR11MB7768.namprd11.prod.outlook.com>
X-Provags-ID: V03:K1:D3e9cmTh4XJIz1ugBU7wH8ciOobQIUwoXw7KdGrxSSskSiBf3h7
 teEIvbNy3bGFMr1xYjrzvZat393ZKIucSPjUP48GBw+MsB90cngEFPDKitDfZ2WiKZbT7oD
 t+vM+Gkoc1gg1wYE0793xbTSTEkC0G7U5b6YZrXKHekGTjkMg9t3/54D7LCrOGb6POXpL3S
 4J2yBIZRYLWmm0JoiAD1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SeP3y1azpdY=;I/EuHKsf+PHkE1MP13tAl51s6pq
 vgFBjcx9Sbf1aJeU3XViUC9XKlDyQzl4elgy3dlO9vEp+kV5XANYcKNZAQoKmgHvshMCidmkY
 3DXBwcB2WDW6P2kTUqSbcQlALc26e1KqjDDo9mHuMQPyssMzUcXB0US6pEFL7O7pm2WVguL6d
 QnvO8ryH9ib8VW6kLYaG/Sdp4SO/JwnKtwJRANzCgRlGLatiyRjAXsVo+nHaGPbwWQ4vZkDVu
 4yTo6rJXrdkmFttgzV9T5JXXmh3TpQZ+CSV/Nf70nxSe+xv+ZZk2b5CeO7CthhpZNtncBmzm0
 2XiDsXoKKB7uN/ML6gZUWW0Q/8kjJZSs3IgDJGUonymjfSZGj2+A7Oweg8mIVStD9kyx9Cp6e
 i2H5ig7VFk9mN1oLagTR87mD3MjpgnaCUm6HLFt59NI8RpDxpgUfCr1gwB+7TfVmFxRwqvgqu
 QtUvn8IPVN6L/EoXnbjhwWSzWzGcFV8mE8ccGuf2vRb9ckgk03d4Gs28hR0KFItkirst+gDZ5
 /rqR5BkZgM33UYdK541owbm2wjDAkWzvs9YQhhEgVoKIdBIWfTAE5ilP60dw6Z9Do/wPQu7PN
 ew8UD2s6rD9mvOg0jutlpojiYBcF3+xE5NZxGo219t83AzC9o02qKvQfZLb35SkPF+meyoZGP
 dIlMh7fhTcoS+qCqMw2fCeLt/taTir8dhlKvoUQwJ8OyKJqgc4nuzpZq6uORzXTC4xlT5+uUj
 qKhe5oPlh8a8UkdgR1WUOL5A8y6/dHur4Mq6iFpzUlOEtZbDBAHB9R1obpkHpnmKMJ9+GAwLK
 EgUBHFP8bdyok+Q/EnDbzcytbjl7lt5htoSOgRNFLpLa73vaKSvSGpIANzYx2PmansIhD/ZX2
 UkwagGaTsMonVNOryoN8qNRtEeCJlJQjaGUMxKa+fI30bZjooX6nfesNcqjTqqvzXfVnNV9UG
 KAmoTj/YQkVW1AdkM6sDVl9waG9vgWkayzT7BvFBNb4/TTLPA0TBNOs7siWeSWlN7nw/Ol5Er
 IBRonfX+BhV7o+zQhwO/O1EfUQ7xp+XRvPUAM4WsIfkqmZ3k8OuDX626ytSwAF5ZIFrZN9dEy
 oGGNL49sz6i2DdDFPK4QG7/UrmHNzydf2UglyT0Ayg8SmuTww73q60bMe87jLc9B08CizPkJz
 PA3AMa4nDqF0nNmeSR+KjqX4oPJJKb4zD/W3dTameRPfG7Bz6OTBmAxpLrbKd9X5gtWbcTEaZ
 bsH4RphGFwXUe50upBTdqcRFWIQjmvSX5A==


--25a2463gtnrp5jed
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: TCP Fast Retransmission Issue
MIME-Version: 1.0

On 25/02/01 07:09PM, Ahmed, Shehab Sarar wrote:
> Hello,

Hello,

> While experimenting with bbr protocol, I manipulated the network conditio=
ns by maintaining a high RTT for about one second before abruptly reducing =
it. Some packets sent during the high RTT phase experienced long delays in =
reaching the destination, while later packets, benefiting from the lower RT=
T, arrived earlier. This out-of-order arrival triggered the receiver to gen=
erate duplicate acknowledgments (dup ACKs). Due to the low RTT, these dup A=
CKs quickly reached the sender. Upon receiving three dup ACKs, the sender i=
nitiated a fast retransmission for an earlier packet that was not lost but =
was simply taking longer to arrive. Interestingly, despite the fast-retrans=
mitted packet experienced a lower RTT, the original delayed packet still ar=
rived first. When the receiver received this packet, it sent an ACK for the=
 next packet in sequence. However, upon later receiving the fast-retransmit=
ted packet, an issue arose in its logic for updating the acknowledgment num=
ber. As a result, even after the next expected packet was received, the ack=
nowledgment number was not updated correctly. The receiver continued sendin=
g dup ACKs, ultimately forcing bbr into the retransmission timeout (RTO) ph=
ase.
>=20
> I generated this issue in linux kernel version 5.15.0-117-generic with Ub=
untu 20.04. I attempted to confirm whether the issue persists with the late=
st Linux kernel. However, I discovered that the behavior of bbr has changed=
 in the most recent kernel version, where it now sends chunks of packets in=
stead of sending them one by one over time. As a result, I was unable to re=
produce the specific sequence of events that triggered the bug we identifie=
d. Consequently, I could not confirm whether the bug still exists in the la=
test kernel.
>=20
> I believe that the issue (if still exists) will have to be resolved in th=
e location net/ipv4/tcp_input.c or something like that. There are so many a=
uthors here that I do not know who to CC here. So, sending this email to yo=
u. Sorry if this is not the best way to report this issue.

does this cause problems for real applications? To me it sounds a bit
like a constructed issue, but I'm also not really proficient about the
stack mentioned about :p

I'm asking because this is important for how we treat this report, see
the "Reporting Regression"[0] document for more details on what we
consider to be an regression.

> Thanks
> Shehab

Cheers,
Christian

--25a2463gtnrp5jed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmefOjIACgkQwEfU8yi1
JYXRmQ//fNZlSzgu2xmzXKCfFq9LUU9bUdIDbAZkgvfsWTi5zV960Fujo8K3RORT
gUGVEdnC3ARC0xHFYY5DMB154H6SbSvWqaGtOqZLP46r4QOz9xZNzadWsFNSPXrQ
uXHF1+TGBT6iy2fZNjql6pnWdHQa06C0uRIKpoNOw8YWK8t4Bmb2vRZ2uPCqIfjU
hdt/XiajVexy1LK2bqR5XG8FlPpin1AZYb5C0g7zUauJxnlkA0oAB3cRrTeqR9If
gEwRJBZA/ktJ1GoYrPcL3R9Lz4B5RMsEw/mVFMmWEDGNOQqrCOvRugtt6JAmnih3
YDJkWY3J1jwHwft3l1C9MVF4lbXPQUSQFjABFETjYdyfld8SHs+qnyAEZo44a91W
cFT7FSlKRMU3oINnzEgZRyhYQbNCPlgXY5kbzoRN7lCYXdZjFcclOorqFKZyWPB0
lvluVQBMD0mFSbqxf4jLb5eeEdwQT7nqLGsko+IKjNFnAo9cs0pA91TeYlqL3bZk
Uk/OyFn23AwePGla+z2+DHRmHuh+F9Y714Ty/hZGYqDH/NhOHXLw9S6Pe3tcVD+t
Id1gpLoEBP1le3TlSX3MN7Paa33KR41SaoAUuEz0/OObLfBlW182mGR5F0aiCIWt
YesVghZdTEpPg51Y9XJV5TpAgVsEwMPssYfZfSLZ8lZNQa4GgE8=
=vy/l
-----END PGP SIGNATURE-----

--25a2463gtnrp5jed--
