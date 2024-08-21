Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF614F9F3
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258572; cv=none; b=h4ePn/uvOxZMBc7BsvrSrGSfrVmGYNyKKu9qQWIZ3+aCLrd8DQiNvve5a8g8iyKAOccXUAqtEWzGa0CV4iRS3VKNhxBaSECl3HFe9bIXawDd1tru8LbdTQywcVG0Ocgl+mwsFgzopEsiJoW1dXNyqA2jEvmAjsnaD8nQH2JfyN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258572; c=relaxed/simple;
	bh=RUg69PvC4VJT/QoaTo+jte2EflazXzB30/Q7VGN+J98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bLsgzZ182s5hyVHnVYwFoiVSmeSkmZuMlS+gQ2NRlwMMGruY4ZWUKXuiuu8Bn0s3njBEmJ6nW+aYb40dliHidpzvt4BuWVr6GQ8ozz6VzXHsKHwWwX/m6d/z3j1Xg9zx5wyG1sySZ7rlDo3uFijAqX5LHJ/Q33hJRkuDapGoHAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5CBF1/F; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5CBF1/F"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so1612688b3a.3
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724258570; x=1724863370; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RUg69PvC4VJT/QoaTo+jte2EflazXzB30/Q7VGN+J98=;
        b=F5CBF1/FK2DKQ2qHID20lJdVTFYq9GP5jasBVOrDMcYlMTMLZmgIrmNVprHSx5h6Ax
         KSVxjkaoeZ8UjaRzcmSwsiifiyAqT2X+JU56KiMkroqN9O5KDkU6J7A6+ZvLwRmwVeWc
         SRPRjkxj30ffrR5fsTKWz3W0gvz0vJhIE7xtkPD8szWURzd9p19fDz/e+YtPAzeAswmg
         8Sz8YpXQc2+WSisquzk7IgNHRoxZxXpOH5i1edovsWx20IcUZK5fzPvpZKSU8ykD3pF0
         yQ1NBceTlS1fd9DLr+tHpedpZj8j9Tzzr/FJOgfNndV5Jhp+RhkAksEhGfU9tCLBxDhS
         qCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724258570; x=1724863370;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUg69PvC4VJT/QoaTo+jte2EflazXzB30/Q7VGN+J98=;
        b=ZVEyo8l49qj/TmK18me9jSTTpAQO4n5OodRLB/BVPw2uxk+6GH/hF7p1hEhg63Quix
         FlIZfmMsnD4LnlUtD4rAKpN/pV9qGfPVa2iChM3273KC1Iy1deIs+iAGsJjD2/tQ/KEM
         mAph00slRfWppqwD8pa9SOJHJhhhVtWAPGsjPqA1wh2MJ4LR5zSh9VUZWUGN/qbDAjWv
         rpxPMC/rCM6O96ekqBtOvdjiIGHzMEe0jMj0teTv4dqwQIm/nerjVRRxMBXKOQvxLLlb
         M0MATmswo+RMuk30ql9NMqOupvlvkM1btI7J0+0uIIQc7ORYCIlPyRyntpyq3UQtLUpL
         88+A==
X-Forwarded-Encrypted: i=1; AJvYcCXbJoZ9ntT4HjPvntN7A0GKro+kKTXUbUCrZT9O4bu6zDO0ypQNPNVmiR4GgSOFA70YVJh1HJ+uyVqe6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOm1KSFnyvgAeSZA+EcONqJpoxjySvy5kadLziD9ibEhswezuT
	gZk8gaIznD3OPykxri4KaCLOC+ltajMzYfb6t1CIPDPauQQf2KDEWKRn6DJX
X-Google-Smtp-Source: AGHT+IEFVDB9uKDdQcuZxWC0w8ez4eUeUcKT+aIyDYXI087So4zKKfgjfNM3pvw0j9i4MVpT8NRq3Q==
X-Received: by 2002:a05:6a21:9185:b0:1c6:a777:4cf6 with SMTP id adf61e73a8af0-1cad7fac22amr4118905637.10.1724258570261;
        Wed, 21 Aug 2024 09:42:50 -0700 (PDT)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714131601d1sm2876034b3a.19.2024.08.21.09.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 09:42:49 -0700 (PDT)
Message-ID: <2bc94ca9dc634785c3f464576fac7450ffe8e686.camel@gmail.com>
Subject: Re: KASAN: null-ptr-deref in bpf_core_calc_relo_insn
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Liu RuiTong <cnitlrt@gmail.com>, stable <stable@vger.kernel.org>, Linux
 Regressions <regressions@lists.linux.dev>, bpf <bpf@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Date: Wed, 21 Aug 2024 09:42:44 -0700
In-Reply-To: <CAADnVQ+9oy6L+oYWJsvy_yMri8vDL9jBQRhZ8nf0SEMm+mT4DA@mail.gmail.com>
References: 
	<CAK55_s6do7C+DVwbwY_7nKfUz0YLDoiA1v6X3Y9+p0sWzipFSA@mail.gmail.com>
	 <badd583d09868ffdd48a97c727680ca6f5699727.camel@gmail.com>
	 <188a0d1310609fddc29524a64fa3c470fc7c4c94.camel@gmail.com>
	 <2449825072217d392b5b631e8fd394e91b22a256.camel@gmail.com>
	 <CAADnVQ+9oy6L+oYWJsvy_yMri8vDL9jBQRhZ8nf0SEMm+mT4DA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-08-21 at 09:40 -0700, Alexei Starovoitov wrote:
> On Wed, Aug 21, 2024 at 9:34=E2=80=AFAM Eduard Zingerman <eddyz87@gmail.c=
om> wrote:
> >=20
> > On Wed, 2024-08-21 at 04:46 -0700, Eduard Zingerman wrote:
> >=20
> > [...]
> >=20
> > > will post a fix to bpf mailing list shortly.
> >=20
> > Status update:
> > apologies for the delay, the fix is trivial but I have some problems
> > with test case not printing expected log on BPF CI, need some time to d=
ebug.
> >=20
> > Link to wip patch:
> > https://github.com/eddyz87/bpf/tree/relo-core-bad-local-id
>=20
> I would ship the fix (since it's trivial) and sort out selftest later.

Makes sense, will submit the fix.
