Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A4D443E3B
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292962; cv=pass; b=fVW6ojz/Pn+le6urUWJEqzGTPGzR1lU5v8Q4rOVOiJbaxAK+UpzzSu+2+OuTaI+KZHOAwZFPm7qm/3XAIdHSlGIYM3HTz01bdN5Pi94NNXZXmOM+i3Agi0TXNkBD0Cke+VakswHye6IcNkShdUecdTbyeCvpsVUE+FAH/dt2Hko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292962; c=relaxed/simple;
	bh=2/kY6gI5Yk1xMI1SVYXumnXuSjxWIMRSCwqdkzoU3Bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LO34CgLmffrdWtMCUobhVp/BOL/IIbpNbzmA7xliUiXrg3e5MWKzlzN+2HPEkBZkb0DuHIW06ghupKSjkSp5lLaM+sq85mn8swJ/MbJ2xHkXhWyiSIbb6eo/r1C+pevFl1Aorcr6x4Lr6V7i3x0mhkeWV4Wa2cvH5G46z5vlj/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=jnSDCS7i; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="jnSDCS7i"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so2783468a91.0
        for <regressions@lists.linux.dev>; Tue, 06 Oct 2026 06:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791292960; cv=none;
        d=google.com; s=arc-20260327;
        b=kvqj1qlmxYx7J1vz14AlMb9yNgKeTE8xGDGL/S0z0IJNz9ZVE3pjSL5xPNFbrrRvIP
         /XgKbzwGA65pwZ2We7C+bxltLqxwr2c7bler1/gS1k9HH5NkVWxLGH+lgdWkpp34HTr2
         GWkgL1qCYoNdPs8V0z/H2uA034dDGaylhy57PjF7Od+fw3O8e3fjmS41GE9l9ySD+2ji
         +eTwY1tLgXv06pveq5vPDxuD7gHTYz2PmZkL02JGMq1X28Ok1pK5ks9zH9TITp0fS0Vu
         Vl3exJYNDj4AoOkCLCBiCGUG/v7Noj3ClikkJDliONn8XdDXrFe6z507eog4ER8YrlEn
         1OdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2/kY6gI5Yk1xMI1SVYXumnXuSjxWIMRSCwqdkzoU3Bw=;
        fh=AzLY817OBUDy5HKtTSluEDJrkZyGc9AWtQNk+0CVvt8=;
        b=ZCe0G3q9JEjSFfvm4KcSMD8Qy/v+AsjxwhrPVxnm2UReO+5QSjCyBK6H25t2JLTU+v
         oexJdVaz44Aa9i8m7HB7R3M7XCCesLoH15rIhDAGTiI7t3eaouOY6Mn7P9h0PUJOGTl6
         L6zEO+2WhrOGV5EdZHxbpL9kk0jlb1NChsNeo2zggwbLR/7XgiEMX5lAC6veaXUM2Sje
         obIh4jKXUVw+i7laPuDevz6IQjSYDYXC474aAEuf6674USc+Mb9ftkppU01WfGt4XiZb
         YaKVvxmSCHR9DbfWGj+RaMSNwhGsWKwPZQCGoOv/JMlksANdORh6qCclKb8s7MKxzhc/
         ZfpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1791292960; x=1791897760; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/kY6gI5Yk1xMI1SVYXumnXuSjxWIMRSCwqdkzoU3Bw=;
        b=jnSDCS7iXvCziZDsH0m+/XJI/GqZiRsFHHMIYRGbBHJGmzrW88T13SLk72M0HG8J2c
         6DjdWwdTbF6cV8uDei0hq9Uysb0WaGfvZsPOH1c4olBT2G6rGtJFOslSeWWt/qQJB0qE
         yfqIId3tihfvtFZrdeUwW3Bgpz0jq8hBNhmvelpHKwUaOyoYy83VNw7kxYikyBjrKgj9
         YcQeAkQOJESe9sFzPtaltppRSowC+3U9d8cdNdpWy9HIDYWPSJIuSquXRI5z53MzMswZ
         ttjrhgiCtfCguHBdYQ/dcmhkOWDfgMS0UtXV1cwxT1OIP0F2nE/HgkWnDfnWkq/IigvN
         tYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292960; x=1791897760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/kY6gI5Yk1xMI1SVYXumnXuSjxWIMRSCwqdkzoU3Bw=;
        b=lGeCI1qttNQiNkjMDhWve6iIxj+lyo1+23f2ruv4HUPwwgypDFZim5uujAYvChZQcq
         4qW4feoDguesnmh0VdvsqGNtzfaeN2CQy7P4I1cQCFJfXhneMAFetmpt9g5Pl6qTuhYL
         J6SafRIilXVYPrKAtOMvrZRZ11IkZw88hO2/HXKsiyLduyYowUFFYhMfcInMZvYdtJCk
         bVIk9iDzsziG4I+7UHV4MxZ9GvqJHUKBKJvDBR4LwDLPhROUtCLfycrGr/ivSq2nELM3
         URpIm0xaq/ejdRH0VL1NBbp4E5YGnzRm5cCLalt4WVYwnHeG6e3+kq/xCVT3KKAGDWvX
         0TOw==
X-Forwarded-Encrypted: i=1; AKwUvBxD3geVj9lNe01J2IotpvWDlCIluyjE4HyE3X7a1pxulesK8iKB5cuW4qMqVGV5nfWZjn+hp5ybN6xw6w==@lists.linux.dev
X-Gm-Message-State: AFq9FYIX1bNeS+h8a5gsqZaipI4LP3nMOpEcCGIEJU70OhpETMaJysSz
	qOGlX0GZsm1ywjPlNvOv6OxK0J6CY+cF+iLmGAYXSjBc7s17tDmhp7xVKaP4JN8swfnBhNu4VqK
	BPgkVJ7bXSZxzIzrUSDlS4nBsQuD2kSGsk1zc1jJJ2w==
X-Gm-Gg: AYBFou1nSdxf5U0noORAEsxBdt+ejon7kBH+HZe2Bmt2QehknWSJNsF/M1rQlZITjjY
	UC3BGk5jFuPKpcvDkQb6Xakxg2KDYEl9o0+sxx5FblP0qHnA60eVWTsjXQykd5fDlrbNz3qCpzz
	9mkbpRqobu8jFgeZPQHq+8mlGBoMGG6cACCgaAgi4zMAOl3P3LSP0lGLJ/l9qc76cLbulJAO3RJ
	iGvoXGkk7tf51elMysp/pcUtOWsoqI4oEOcKR2wiekuafCn98PebnMy8SU7ZS9ZozgEqNKYb13W
	10CTWNNWL0AFkpvI8NOYMXilRRsoijfPTNsbRozGXeWYVJiOz+tS2skwnfmdUN/kxUbA9VQQodc
	9b8juvbl6lqzjmW4VJL4/EY0zfInm0mjf+flr7Nm7dELdBDNJohVP+3XRqBhVE/lTL0AiRIMpbk
	o=
X-Received: by 2002:a17:90b:3ccd:b0:3a8:878:ebab with SMTP id
 98e67ed59e1d1-3a80879621cmr5255577a91.35.1791292960306; Tue, 06 Oct 2026
 06:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
 <f73ca71a-8a22-495c-91a9-12d89968ac2c@leemhuis.info>
In-Reply-To: <f73ca71a-8a22-495c-91a9-12d89968ac2c@leemhuis.info>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Date: Tue, 6 Oct 2026 15:22:13 +0200
X-Gm-Features: AclHuK-K9pG_NO9KBdAk3iESUwUuT_Z21z8xG2zR0qRYXTeutTuoi2M9aya7o-A
Message-ID: <CAPa5EdAxXiHKrdrUk2nrbxJzgh_B3jwkTP00+rV0-xk=2vmiiw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] r8169: TX stall with checksum offload on
 VLAN frames with inline tag (REORDER_HDR off) since 1517d1996b52
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, nic_swsd@realtek.com, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Tue, 6 Oct 2026 at 15:10, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
> Not my area of expertise, so take the following carefully, as it might
> send you in the wrong direction:
>
> There is another issue known for 447cbe95ebb9:
> Commit 447cbe95ebb9 causes IOMMU DMA faults on macvlan/vlan with bnxt_en
> https://lore.kernel.org/all/20261004122616.56714cbd@nargothrond/
>
> A fix for it is under review:
> bnxt_en: fix DMA mapping length for padded small packets
> https://lore.kernel.org/all/20261006042153.199444-1-edumazet@kernel.org/
>
> Is that maybe related?

I hesitate to tell it's completely unrelated, as I don't fully
understand what breaks in our case, however, I'm quite sure that the
fix under review won't help in case of this regression, as it's a
breakage in a completely different ethernet driver from a different
vendor - bnxt_en doesn't play any role on the affected systems from my
report. But _maybe_ there will be some clues what should be fixed in
r8169 in the discussion for the other regression.

Thanks,
Jan
