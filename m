Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E72828E5F8
	for <regressions@lists.linux.dev>; Wed,  4 Jun 2025 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034812; cv=none; b=mrZ25TLkjlPBmcuhDKs77RJSkoRYA1XfIhHdiACDtSX3Zb6uLe5481qS+j4Ox6UUZm3sDerediooGsWgu98ZpRbxb+Cvo54eyWiEIslBl4BbMLu93+QgFhbhs9ezAk0DTD5uk6PKTZKKALXGDCbPV2JWnX4zyVCyv0S2/ipFyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034812; c=relaxed/simple;
	bh=Schw2RsYLQNpi+xEERdg/mqlrK2JYXvaTEsebGb49Qo=;
	h=From:Content-Type:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=anSyolsIVfXow+E49868S2ZT/chg0/Wb5UFjh2F55blx37dePxBKL5m/VAEwgD9BVmEIhOOx6V1+ZjmdLneCLOQeVUjQn9C0lDdpKLzyqS55qYjJD7u2PcEajH5mSXaxyNX4UGhCc1srGGRXzJTwGnMPNu93zfaA5+vV2ZtNHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc7crfSb; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc7crfSb"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0ad74483fso64001536d6.1
        for <regressions@lists.linux.dev>; Wed, 04 Jun 2025 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749034809; x=1749639609; darn=lists.linux.dev;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Schw2RsYLQNpi+xEERdg/mqlrK2JYXvaTEsebGb49Qo=;
        b=Hc7crfSbprt6q1vMefMgM2In4lsJK2T3dvhBAOvsfQo8v8VDgrIOd1fQQH0xkebdVc
         0hoPow6pXQKtMw8s8LJJoU57E3M81tAriZRRz1zcOqP4Pko7prekeBTg+Q0Bs/dS0VW+
         tpHthRyZ1wnHbvJN6c0oh0vxgX2gqelDvwVdRl2hqs1d4MRvvADat0x1jGpUG5nihqgO
         0hq10et6obAzyzcbWzXOS5qV/bvGQGupX0iigBKfsr0Zbr0S1Yx17oHXuaDy9nUAKCx9
         ljQot/UjFuronZFJ96ScJbXBnIJQsiKMI8oMn7Kor2eOVsLc2Pit6Sc9eRmdI2wyO+6N
         k3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034809; x=1749639609;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Schw2RsYLQNpi+xEERdg/mqlrK2JYXvaTEsebGb49Qo=;
        b=AmpiwZnIQUNeX+BQiV9Wv+BXRf02MYzffxHSdJ7vQeGlLgInTGHpmynHu9IqHgnO5I
         09Wus6BQetd6iv9n8ZQ13pIFrKRQBK0KrB3fIlf8M8KDhm4l0H/QvjrOpAmMsVVp3GNZ
         O4Pp+UL98ESuIlr93DEVEskXapHBZ5z7sj+1gG6rAECTC39SXdWGPAlyq+8dsT8pb0x3
         S7GJhrCK5kLYAnPM8s2uD9HpUNsRE7hoqxQVKXx8DKHRf98vdquFZRzfm4lxIfLysJX5
         pTnG6b3OaGImW64VLoWwRoAt5FWcWVlVzofjbcxl0/SdAmtJsJVu8LQb2mFspbgVbqbV
         rmHg==
X-Forwarded-Encrypted: i=1; AJvYcCWI7LPKbmM7nNVur9Aw+AiBVl+Nr+Vfx7ND+4bLC91kkxhHAlWCbRVw8cUG3arPSWxF55z4I0xGfLMm3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGMPU8uCAQWGM+kIMzyqOjZ9A8JbGPTDsO/T0Og1gf4EW758z8
	zqDaeniRQY6SPrA0pgTNRP4wB5eY9k/5T6mjse3Gpf9zVJf9sAGm1F8e
X-Gm-Gg: ASbGncvAnr4GEI2SfSRaquX0a1kkcUs/MSwz7s+oDfMPWKyQAvR6nRez9bSQZGpktug
	/RbW11GloLXwSGeM4vQ/K0mLqtZVDSuDryJnArfhArVh+w88zG/0L+Xupk2MWNmPvUXmvgH3hQo
	KMfjRsDCRnGezdu2LgypyHnjGWiTbtYIRdw/qaP5GI9pQAvIjTB/WkSdMpcHgvFIXQjki2oS+Td
	B+sOJFu8/hFSNN+U8va7bNVU9iBTWvK6KTD76hFJFHpGIeR9dEicT82F22nlHSiDGo1VrMBoF7k
	/F2cQcQsaoYe3jGCrCnr+W2SHfhca7u8rz6dRbadpId0QvjKujcOd1vfxAikujcIUAnDsLMnn8y
	COrgR9zjZ542O2yCxrT2TTxZrDcDaQSq6A4wMpL3fxQ==
X-Google-Smtp-Source: AGHT+IEqSF8mjarZ/kRpcwxU9I19cNQnsgHots4Mmgea27/PfoN1l+IsQDKOfP8c8Ri0J7J4W7BS0g==
X-Received: by 2002:ad4:5ce2:0:b0:6fa:bb44:fddf with SMTP id 6a1803df08f44-6faf6e87e98mr35729696d6.16.1749034808945;
        Wed, 04 Jun 2025 04:00:08 -0700 (PDT)
Received: from smtpclient.apple (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fafb6899dasm3364456d6.21.2025.06.04.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 04:00:08 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
X-Google-Original-From: Rudraksha Gupta <GuptaRud@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: REGRESSION: armv7 build mismatched types
Date: Wed, 4 Jun 2025 03:59:56 -0700
Message-Id: <C830877D-1EC4-4F94-947B-8B5CD7E09546@gmail.com>
References: <CANiq72kghKg7FU=W_yO_q9VuCf=smiyzvrcU8oOFG2FFFsOQiA@mail.gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thorsten Leemhuis <linux@leemhuis.info>, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
In-Reply-To: <CANiq72kghKg7FU=W_yO_q9VuCf=smiyzvrcU8oOFG2FFFsOQiA@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: iPhone Mail (20H360)

Perfect! Works for me now, thanks :)

Thanks,
Rudraksha
