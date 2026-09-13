Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E7D369D74
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321272; cv=none; b=iA12nlvwj2yYoDOypx3pD4Ui240O+t12P8z5MUImZgroilixDcbghRuzVwRUOyMnNbmBL620UvPpZd65pPqe3dOQIfnr5GogFYOkBeOcjDT5d1syr61h1tCUFqxfiaLiRsJVVAdaDaYRXjDWstp5JYrLyrjRk/Bk4uCW4PW2+yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321272; c=relaxed/simple;
	bh=ww2B+WA7TV01+U+VaY667gb9B0QSkWPf0yPtPcX2028=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfkXjkBN17IAtufY/L9Jl6KRyFGMj8UCDibePxaEuNz58eCVMeFSHNycGjNZIkL8IdHc34gzG8dVitfsuzO2Mf/8/iOfyae2+GBeg5WwcOz6xtumHCjaYM3okfOTN+H5mc/i0Qhn8tEIFWF8Km7eTH5X8SoFpkH9eGIEkZ7zVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FXMxXabC; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FXMxXabC"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so184310766b.1
        for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789321268; x=1789926068; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H2Y871zvJ9dINBDYYDJG2gsh1yKXtKEQWd9l/ilLgM=;
        b=FXMxXabCBjb2nP0q6tubiF8M046Qta0blA/O+W+qISk8wu3CsxqTvkOFpMx4ffyxBo
         MSXtM2xcwXrOrJ+Un9jT0zUeBerhld8rQUEpKec7YF9Bi0MjUDOk8rW+7pCGMrxQ869E
         691DP26uIfe0VJHeayphi9qHiTmtYJ44lAOsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789321268; x=1789926068;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9H2Y871zvJ9dINBDYYDJG2gsh1yKXtKEQWd9l/ilLgM=;
        b=iNFkQ8Ilj8pwskwq9bNsILZSJo8j1ZzAG7d3xhVEOb1xNjnru3FuGZrMMfDG4gLZDN
         EXeoZyC2XY5UoJhUj6igU2fpT0B0FljprQa50BZvE2SOxKhD36eRjF19iHhGf15byzV3
         wq7bnLgBxYpJrvTDALwQGyVToQirW2v9I7PTFGZcF5FAhxJBYUkKEuCyvBBBsNTTIkzb
         EdyC5c3SB980jT9s/YBd4ce+LlmKFUoxjxr1cJKotV5kh8c+z/ZbjXT8bB6TFAmcv1K4
         eeayin+Um2ijB3/MKGSOsgWtV22quTA08h8iiQ/Ydo+7smvND9PSO5QmvuYt5UtXyPwN
         JG/Q==
X-Gm-Message-State: AFuF++m4onyq0AfoPqMHSK5m9xoZGSWxe8jSQXOClabxQMxNAujXo1u4
	FL1bPxYru8mnnYBSH981METSW6fXxtF+fD0VJCDmsQ1QZ7CGRsokn4XggAX8Njhf1TpJkS+O5JZ
	0jEZR4Bo=
X-Gm-Gg: AYBFou1+o5uEvBeynXSbBz11l6dzk1lBM6ADPJuIQ2Ks437keahns3WPI4orTXbcx88
	Lg+c2JbtvPxMkoByH2l1kHjQovN1eSeTCVl22QrujfnIKNPG+XI8KjGOQgbP2GDn0gJIoZoh64c
	qEPNymS9npWpBsOAuwEzqz/UF+waIV+u4vxjXlz+d65ail2idsAV79oSgb7wR9yl7S+BYNpOnM+
	OLJyY0EPfu63itPnfU7WH1jHzx2HpEYzxKX9ppiulThr9xCIaLuihApTAf7Uldn2fc6k1FzkUW5
	787XM2PksXcUXxr5vJWsyvdrZoDUw84HT2uRRZVDkkzFTdjPtc9iXdssZqgyXiqOFl3ttsKlsi0
	3eqrqkGDx+iZt5FHW3MEVRsFLsqTe7jIpsiyuCqOKBvt7Tmf28g4YEhGioBzd0qEIZ5Bh87Ftsb
	2+CKPsgquBnacSYSPIHLEED4vam2XrA2MjmtKTazQfidY8c/JhUhBGUZC97F8kGmVjWMatXu38w
	KQSSOcyDOwE4ayieM77oAcphTxbhhBEpScaw8GzDgnPaTp9Eg==
X-Received: by 2002:a17:907:72d0:b0:c29:48a1:be1e with SMTP id a640c23a62f3a-c2985877b8fmr415411766b.25.1789321267992;
        Sun, 13 Sep 2026 10:41:07 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966063a2asm315346266b.27.2026.09.13.10.41.07
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 10:41:07 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso176149566b.2
        for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 10:41:07 -0700 (PDT)
X-Received: by 2002:a17:907:3f8e:b0:c25:9102:ee with SMTP id
 a640c23a62f3a-c29856feba1mr427254966b.3.1789321267492; Sun, 13 Sep 2026
 10:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
In-Reply-To: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 10:40:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com>
X-Gm-Features: AcwNN1XLn2ExfvHCXGShVUJeV_gCvDuPfG1koc4Na-S68MppeIKQ_fCxKbGSmlY
Message-ID: <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com>
Subject: Re: Quick regression status pre 7.3-rc3
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 07:32, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi Linus! Here is a quick report about a few unresolved regressions from
> the current or the previous cycle that I found worth mentioning for one
> reason or another; fixes are available for all of them:

I applied three patches for these issues and merged them. That
hopefully takes care of at least the IPU bridge and the mt76 issues.

The rest appear to at least be in linux-next, and I left those alone.

Please do double-check that what I did matches what you expected...

             Linus
