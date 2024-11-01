Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7545914A09E
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480645; cv=none; b=XzdSi3kt2fgEPg7c1eKdBoTYE5piwo6TAe4QF4Fg5ySH7stErZhHCEtI6qfHUj33wW7MWbC3pdOWXKsw2ZM90fCClR0khS7ztJLNwOkOn+RCaXBDbhKwL794+VZh1wceqCuPAoLXlygnnQcGibiUvZynE70FsxXTFOqw0aN95LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480645; c=relaxed/simple;
	bh=G7YUAtokdu7yRwuXFCob7ys8rE/bsipsEJCIqPG5sSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCi3SvJ5shiwM3rrowmqaT1LiFKEMZCTwklnq/m8sOaeM6TXZKqWOWGo6uNRYI78VEhpPX5FqfKPertSbHWitR8VkxmWM3CFjE1lVNM/9G4dF3ayi2t4OVTJqv3YXtF4bSB0tr+zNNlyiK+riFrEe3UE+w+Uqv0JIrXb3uICClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h29cpX+N; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h29cpX+N"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c53efc14fso3120055ad.0
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730480643; x=1731085443; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBfjrQjC+K3XRUNkllYf81cyTHRDd6nddEiHrej+VtI=;
        b=h29cpX+NOSpRVsrcFxHNcqpcqgDiQ7H0gTGBqHz5vwB0r9RLzRMaxeHNqZw7Ncw8Ib
         vfogOSaMwU3nHh22vLMHq3ZH6aVjRwow4zrRah9mKv6a0ZnfcF4Q6fXkgGapJRcs9f86
         8DkutfQ3BHESCQMBZdlxOtz+PuuUf9bflEVB9Xw+cNiWGt0KjfITILpdnvjUhVoEVcCe
         h+EcibHj1eyBWFaiTKsBKReWDcu2T3DWfR6RpDpwD6L73/tTw+OKwzFmLqKFp7JQditb
         7IumlenxSPE8oJprHWF8JVkf4BFZUICR/hugT5iCPBaLGXFLff7nMdl+heoTYLOtC5NA
         0pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730480643; x=1731085443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBfjrQjC+K3XRUNkllYf81cyTHRDd6nddEiHrej+VtI=;
        b=dV+GSxPNUIwMxvVZEPqB9q6J5Nx6VkICn6VkP9MujLe4bvqglhIDoO3Tscb9VwbZFg
         1DCxgmFQ1rk9SWs/7A/tau9jlGdwUgGEpcMyunWNfrpDWQM2RpXwZhXO7v/cfpj3LtC+
         i0gEO2MNQGf3Budd+koUtMg9Tb2dlJVAB+3G6tkVajgCCZdI309CPSR5pHHLkDKQc/oT
         crU8YyCF+3JTUVstkChuwP+88iU3AIi9YAHNi9LzfpmIRv791hw4ABpvSTyrh8uJ1VYn
         ApmTMzwAchHRv77IXnVJIihwQzrzlUccNdKPxxj9AHdszUjpSf61XrtS7HO0mEmIACWO
         OfEA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2RF+ame4WcAtq59rd8WRpTGxOWpGvuimMBW3H6DXOMJPksg/FpOi7cevnVIi+uGojVza+QuRUEynyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTi0xkZdeX44goD+eFIVcSrtM4+CuMTfTWeBySNpqrnOi41N1t
	KUUq4PbWLiLs0CeW51OPInhhMKG0uNsXB5On8pH4DKqQpY0t6kcMdoxVsg4JDfTsMavShUHqIA4
	XH9dLlpYFaRC9tyDYZA3UGKz0SGo=
X-Google-Smtp-Source: AGHT+IE989mVcGbFzSXUTNEne5q6I3f881GzwGh8vhKMnckzkFdiEGpT2eiUs8ItoTop4yVyd0Xz2gGTKnuMyPDuFbI=
X-Received: by 2002:a17:90b:3b48:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e8f0f4ccbdmr11862428a91.1.1730480642714; Fri, 01 Nov 2024
 10:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
In-Reply-To: <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 Nov 2024 18:03:49 +0100
Message-ID: <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Paul Moore <paul@paul-moore.com>
Cc: Alice Ryhl <aliceryhl@google.com>, naresh.kamboju@linaro.org, casey@schaufler-ca.com, 
	anders.roxell@linaro.org, arnd@arndb.de, brauner@kernel.org, 
	dan.carpenter@linaro.org, kees@kernel.org, linux-kernel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, ojeda@kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 5:56=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> Thanks Alice.  Would you like me to pull this in via the LSM tree with
> the associated LSM changes, or would you prefer to do this some other
> way?
>
> I'm going to merge this into lsm/dev for now so that we fix the issue
> in linux-next, but I'm happy to drop it or do something else, let me
> know.

Christian has the VFS side, and both are needed for this -- do you
mean you will cross-merge vfs' branch too?

By the way, merging both vfs.rust.file and lsm/dev I confirm this builds fi=
ne:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
