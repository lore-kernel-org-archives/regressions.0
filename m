Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021340;
	b=PM5stgtEaZGbLUY1VNMa9oOA1oaRADTyHIPbAahptsQDWRlfMQrwKruuqzKcpsC22vOo
	 UWKH8C+QN0+6n2QooAvwHcJsNNIPim7nOJvdJje6bQouIaOeBRamu+BpXT1cUPSBC/2mV
	 hsPSBflYlpqfRgh4S/AIVhd1K9sW1wdXqFVql+plkb6zc8166RyRPfzdDm4ZP4YlsqJyO
	 bSmw4p0MzaFSik48MKDDNzUgezyQcCshUrAOFTLGrmAyXksYTyNgXkTsqG3vec0gwYA0M
	 NC6WApUAJubWclRS6Mymjhf3VoY8ngcgQYkPfQXJTgeOkMk+WebDsG3+FH2Qh4VKX1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021340;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=04ULgjusWlSg32LjKqce99PoYE98Nn7GHteRBpuo00o=;
	b=vjsWhvhLrb1tOYGPXG+CAxO1CYc8cMtjA1uqj1U+uo4NkPPzDV9TCizg8yy5chmy+ea6
	 RWkQvx/T+G7B+sJsHN/UC1QowXheXV5pFk4szhkQW7Btar0HjDj4DsC4OO8tW5iRo+U38
	 WAjaY85CbtNiG3ZHDA9IMtnb5FQzgH9W93NQR+vn0+tbhd9W/XslNGVhsEjEZUNOe407M
	 SkW67CWO9LJNjMUBtZyuIFuCrKWa2FoC7XRi4iHS/+4rtls/XsUvBJOt/cUBML0wIUgLy
	 kLC0RPlxQGN75/VWcZzIK+WTb0CWpmCoqqVN+pU817nDSYHCxnjqCPbgm0C+IWNfNWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMnAFsYT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85393606A31F
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kMnAFsYT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCAB1F031E0
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793021339;
	bh=04ULgjusWlSg32LjKqce99PoYE98Nn7GHteRBpuo00o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kMnAFsYTdeRlFlai4nhvqWF9NBW4YEJ6tnFv7BHj8vOhHyZHx8nm0zfckOofb/EHe
	 sA4kA8Yhyp5kwQg3lCKaHqbVjc5os9XfGijBFc4v+74SH/u10UrLDcbwASf73DX5Qa
	 L5Df3QZUZnywZIXm8py9ROWJGl67ZBsokPP1gpgERoNwf4BhqAs2qez7RtWiUhBGAy
	 wTpLAH6EgUXF2cU7QSSkIzbyv8/pI3qPp9AZN7iSTUi3xo6mang8Og+ObyTczfVPcI
	 7IZCNAuxk+txSpxzOBmU6KhVeKr/yW7kQ3EjbhDMGZw8+ZBl/2F8kUvW6dne22qjz5
	 iyF9xWG3kQW2A==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-483d290f398so1735026fac.2
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 06:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyHVHSzY7ilBGT1YSR3e+SEsStlsTQrXIeX7/qO2rXdMuX1T+Dme7bZMy7FvcPzLmaiNgXp3NyOCuyAw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLRt0mJWsPqb6bbwBXBXdE2pfBSBX43fu/E41EB6CSGMf8DF38v
	hBaL2Cwx+6wggI3NBfel5N704IE1v4D9odyTTVwU7TN+7ZLdhQlU/qqcbJjNDRVuRBHA8/dEw/h
	Znkfro/eYLTk6ohjYwSKKzU0jfS/Y7RU=
X-Received: by 2002:a05:6870:3c89:b0:4a2:4c6c:c9bc with SMTP id
 586e51a60fabf-4a83f4eb527mr4042375fac.19.1793021338390; Mon, 26 Oct 2026
 06:28:58 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
In-Reply-To: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 26 Oct 2026 14:28:47 +0100
X-Gmail-Original-Message-ID: <CAL4WiirsfX-j2uP0HWq4dSPGK15N9GqjY6yz+fMFKreo=1MR7Q@mail.gmail.com>
X-Gm-Features: AclHuK_7Y8Msockoq5cYfVUJitRoh-SWV4M7WKxBOBmiLFfT1caFqcdtwGCa_Us
Message-ID: <CAL4WiirsfX-j2uP0HWq4dSPGK15N9GqjY6yz+fMFKreo=1MR7Q@mail.gmail.com>
Subject: Re: [PATCH net 0/2] Revert advertising the TCP MSS from the
 configured MTU
To: echoowall@gmail.com
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 26 oct. 2026 =C3=A0 08:23, Esko Mobius via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> a =C3=A9crit :
>
> Commit 2640e6419594 ("net: advertise TCP MSS from the configured MTU,
> not the learned PMTU") breaks TCP for clients behind networks that
> filter inbound ICMP, when the server reaches them through a hop with a
> smaller MTU: the handshake completes, then the connection stalls as
> soon as the client sends full-size segments. This was reported in [1]
> and confirmed on 7.3-rc7; reverting the commit on top of 7.3-rc7 fixes
> it. Details and numbers are in patch 2.
>
> The asymmetric (DSR-style) case that commit targets can still be served
> by the existing per-route advmss metric, which overrides the default
> after the revert; patch 2 includes a test of that as well. If you would
> rather keep the new behaviour as an explicit opt-in some other way, I
> am happy to test or rework this.
>
> Patch 1 removes the packetdrill tests that assert the reverted
> behaviour, patch 2 is the revert itself.
>
> [1] https://lore.kernel.org/regressions/4F0FAEB6-A13B-47F3-BFF1-C706686C6=
F64@gmail.com/

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Even if the reverted behavior was closer to RFC 2923 / RFC 1122, it
was a long-standing
user visible behavior and should not have been tagged for stable.

Relays should really clamp MSS (nft "tcp option maxseg size set rt mtu"),
but a revert is the right call for net and stable trees.

If needed, the asymmetric/DSR case can be revisited in net-next as an opt-i=
n.
