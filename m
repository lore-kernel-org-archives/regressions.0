Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E11B27D
	for <regressions@lists.linux.dev>; Mon, 20 May 2024 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716190526; cv=none; b=Tb2HgMOOmGoTIuSRNNN+H97pOOrpvhcxPd911YdtTYeKmfwxbMNTMz8l/CSpDepcdSfy+RcMP6igDvvCqsbBq5AOopQbOD+wAjXIg9DYy7HePTWa4PiYGyUBTlQNfcMgoAS6EXX8TtPTdarD6PtyiSkwTqJheYwM0yiTGgGPjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716190526; c=relaxed/simple;
	bh=CreGSXMBFRDdh+HIhlg2OcR+mWGxYmJCDZEvadFcUiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tH07j8fFEhxW2OaLe6vEf/5Wme2cLVZq2+kbb8tr3kB5E62f4je0OqLbwjXGiw7Tw1+dyVgWmfT1UYjsPBE0IhZ+uoXXHV8kWSx1Ktw7SWdqCI1S3sR6KRX+Jz82Z6B5jeV872TFXSQhoWS/5kRemKuSV8VWNe9UmGsUAc0b01M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B4rffi1G; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4rffi1G"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ec41d82b8bso75573705ad.2
        for <regressions@lists.linux.dev>; Mon, 20 May 2024 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716190525; x=1716795325; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdeskcQGCOqUgsMYL0wvQIQkx8Opxo9clxqEYF92eYc=;
        b=B4rffi1GhUdGf6G4pCGY0K3XD3JfmjfBaOwLzmpT5s0fP3jPVoJLJOKqu2Y2/70Vuh
         kKjoG6jUtr28VRlifwxeH9wNY/cwIscztZbUYYUHQfLWH9SuOuXDu+SlgABd1myx0PuW
         oVXuSt/dvAtxqZUOTYYYShgvEpZr3g3StmNcXmKtfzcwggo8IMXmyen6emsCc3vXP7/1
         JWF/QSpwfpr9mkpvL7tqCxwnzLkuMYxdX2VonitdDGUze3qOa9knwRd4vniBwrFnLxbU
         bF5XjIIAJKUk+OttZTMWyhhY5ClMp3BadNeOvmfVqp6rlIzk2C4UtHIi12W6HCrmCnlE
         n8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716190525; x=1716795325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdeskcQGCOqUgsMYL0wvQIQkx8Opxo9clxqEYF92eYc=;
        b=iZ9SfdZ6SaqGgYsmRIgxph0jGFa/IE2MROR/W7bgmQv1YzSGa9cyA62FUuIu6+/r3E
         RnFgmcbcCLXlP0ReqfDBjKPAYSeqMV2yC4T6xPyu98NxztBNr1lX+VXaVTJCLcbMDVoC
         EZvoejH+/sbP+uoCww1+bZS8Bb2YOYWt/x8JgsWG6JclR3LsK6T6NFT5MzxlZsKmKTqi
         kchCJ4rzo2g5rKrVEk0gxYgIKPpNGf0gtGNQu+cfXVSuvVd54hfo4NmsxKwjKzqOeWWm
         12hSn0hnxchwT2FjMk9IUikjFCm/V8PIr4ock+yWdwumA4ZyJVACMQyFkaC0d2euINPl
         27Mw==
X-Gm-Message-State: AOJu0YxgnD2aUgVjRQsO2ikjfoLeKiK+nBUmkXYqEGnzOjZC1lmB6E/o
	W4j6V5a14nvmm+tpLAlLpb/DkNDzP+1Hvy3o7ewrcT0H6ipZKomBL/aUEzGqmtc=
X-Google-Smtp-Source: AGHT+IHPnUMf1hHaC0TYUlsq97fbQdCCRP95VeDkuaFDGW9CA2YAIYyeywDjHu54+bcWgGQVcpgq7w==
X-Received: by 2002:a05:6a20:c78c:b0:1af:cb89:15d7 with SMTP id adf61e73a8af0-1afde1035a8mr32774233637.27.1716190524677;
        Mon, 20 May 2024 00:35:24 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bd7f6c90f0sm1214435a91.2.2024.05.20.00.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:35:24 -0700 (PDT)
Date: Mon, 20 May 2024 13:05:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] OPP: Fix required_opp_tables for multiple genpds
 using same table
Message-ID: <20240520073522.3nhy4x6fnrqxay6x@vireshk-i7>
References: <2eb72832e852c80e5c11cd69e7d2f14cefd8b1cb.1712903998.git.viresh.kumar@linaro.org>
 <e6fc06eb-fe52-4cb3-b412-a602369ee875@leemhuis.info>
 <CAPDyKFoHoKK-RZsGwnZhbW9_ZRQtL1MFZBuVVLMx-MxL2cQQbw@mail.gmail.com>
 <7c6df194-fce1-401a-98c5-c903d78627c4@leemhuis.info>
 <CAPDyKFqKRy6zJdBpK3bNTvkvAjty691-Vi_HV3E5CeqgRAWGmA@mail.gmail.com>
 <CAKohpomKbhdXRgFxxbg-_hG5EFZT0LrvfQcrwjQPon6AZNbGag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKohpomKbhdXRgFxxbg-_hG5EFZT0LrvfQcrwjQPon6AZNbGag@mail.gmail.com>

On 11-05-24, 10:03, Viresh Kumar wrote:
> On Fri, 10 May 2024 at 16:14, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > I wasn't sure of the level of urgency in this case, as I don't think
> > we have that many DTSes upstream that could hit this case.
> >
> > But nevermind, it should be easy to revert/replace the change when we
> > have something better to take over. Viresh, feel pick this up - or let
> > me know if you prefer me to pick it.
> 
> Please apply, while I enjoy my holidays :)

Merged to Rafael's tree already now.

-- 
viresh
