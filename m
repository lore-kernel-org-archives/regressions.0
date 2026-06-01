Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073A21146C
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322611; cv=none; b=l/6oGPPFOsrrM+Nz/WLAQU84oWjgIPXWGlxW62cwANYWjyqQlf6ow7tTaoEQdK4xBp83Jl29Q8raEGowPEsB3Vj2Tmo4le4tsCJrXtIs/PRuIQq0QuZWojzr1OEzBUzF0FWGROEwMkJpLiqb0lnXDEoDKoHzHVhz6L9XjgQek7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322611; c=relaxed/simple;
	bh=CFrtvGmfhUK+/WMj5uzU2Dr0YEHsNNcF9nrXsbVp3js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulBIxGTuiqrVtcGtqTG4JKp5C4KU1pKJ4yPfFql455SaawgkaSr6B5TsuNoxIrMUc7nOI4TJCBSnmWBEyvUpDNykV9shIaNnmqi7FbAjYct4gEqe0wcTpKLsHZo/PWyD3Ez4jFtwgdGkK+IICVQIhuz+UBLTqHiGGe02e3VmevI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aSC/RtXk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aSC/RtXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780322608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFrtvGmfhUK+/WMj5uzU2Dr0YEHsNNcF9nrXsbVp3js=;
	b=aSC/RtXkBLhSywK4v2wgzYMUhA1MU5DYEom4gaPkjAcy4Zw/zYFAlA1gjvbZqp+wYTb6i+
	oohxJJ3yUaqpzlJQ95mLfCWwc2XTg/8VG9X9D5KdO4+LtovMY3hN97Tse9GxCIJW+xkVuK
	rgMiHHHNUcIILVb+G4OV27jbBtSXvSA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-6Hu20nHIOLuHALGleBbR5A-1; Mon, 01 Jun 2026 10:02:13 -0400
X-MC-Unique: 6Hu20nHIOLuHALGleBbR5A-1
X-Mimecast-MFC-AGG-ID: 6Hu20nHIOLuHALGleBbR5A_1780322532
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5aa68cf0a4bso770661e87.0
        for <regressions@lists.linux.dev>; Mon, 01 Jun 2026 07:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322532; x=1780927332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFrtvGmfhUK+/WMj5uzU2Dr0YEHsNNcF9nrXsbVp3js=;
        b=cblmyGvHuGmP+eip37Km5K8gMhfs3gPt+pAc0HtoduDhi8oIRSJP0flJym+6IuC6Le
         PjUB53IA1jvZF3RyNMiOo8yNHJY+wTIt/iHIKtaW6aSmwbV8+q7Nx8vpxgu05+KbHJ0S
         1QZ4cJtex9GwadvFoBOQGrhqBEZwhlpxa7Dhp1ILQmhlWqCnfjY5S9FAmWFLnE/tWq5G
         x+K0mRaGaHnmN2tUE2kGjSNhd42AmTbiNy7y6DQMabQi2ly07mDFqY2wRpW/B2K3YhuC
         nFL6YnCG/wMheAigx/KHIf9SdhJ017GAJ+NepeKhmXPjgWl0c+pLcuiw53w2aKEch4VW
         bw1g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZuzRvQnK8E4bIYTnrboHczXsLmZtK1qcVjgNGyxPHf1DMf4Xgo/5HwE0HLmdh/6rsxM5mwgmClIWH1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf9LPhH5ML7iZ5SnmVTKWga6gr4lV9XDU6uS5m6P+CZcadU41t
	oj7u66Y9NOZ8KwqSS8Xf+xSQETpfeqj07VuAaoLApUK7peSQ1WAdTLQBXUXUc9i1kN4PYFgrIOy
	U8JlpIc/rZRmura44U19UfNeN9gHWCt2I3pp7azRlXjlrrL6x8tGnOuVr9Z+R02602onGG6JAsR
	heB0SNBss94TO+QiIJ2vH2K3zjwlPdKh5hXWCQLqg=
X-Gm-Gg: Acq92OHkf6B+uc58Dmgd8wLY9khAG4DPkIHkyCXfY/7ojl3/yfIn/TRRX/UmyVv3559
	TJTeLrgZdb7VSbM5ppBGcNcamdd7Lh2aA/EEhSuW3ikcovBLqvUya0B/hZq29S8VIlt+PWuyQds
	BvDGJ1eG0hILRiqhvCutcOfODiqvxieLdR8JdpiLR/0YT0s+T7ZIr89lteLMxNjS1+1y8EH5DJ9
	sxK7+8pk86IqZLV
X-Received: by 2002:ac2:4bc1:0:b0:5aa:5a97:2458 with SMTP id 2adb3069b0e04-5aa61425f14mr2415828e87.11.1780322531278;
        Mon, 01 Jun 2026 07:02:11 -0700 (PDT)
X-Received: by 2002:ac2:4bc1:0:b0:5aa:5a97:2458 with SMTP id
 2adb3069b0e04-5aa61425f14mr2415792e87.11.1780322530483; Mon, 01 Jun 2026
 07:02:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529112357.5079-1-fmancera@suse.de> <20260529134045.56330243@elisabeth>
 <5079261a-79e5-421b-bf6a-a511acaaeca4@kernel.org> <20260601153525.546746a8@elisabeth>
In-Reply-To: <20260601153525.546746a8@elisabeth>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Mon, 1 Jun 2026 16:01:56 +0200
X-Gm-Features: AVHnY4JxXS-z4a4yH6TIUqvRMklNXbAPyg_Hp4sLwPZCvCtUY9zhA3JOHulUR4Y
Message-ID: <CACT4oueDv=KRZmJw=1N58EN7eoFz5AqbBBMP8FE4=+rQ99oFEg@mail.gmail.com>
Subject: Re: [PATCH net v2] Revert "ipv6: preserve insertion order for
 same-scope addresses"
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org, 
	yuhuang@redhat.com, justin.iurman@gmail.com, horms@kernel.org, 
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net, 
	idosch@nvidia.com, dsahern@kernel.org, Chris Adams <linux@cmadams.net>, 
	David Gibson <david@gibson.dropbear.id.au>, Beniamino Galvani <bgalvani@redhat.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Andrew Lunn <andrew@lunn.ch>, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 27Gl77svXgIAHuIopqBgQvu9xaPvBKjSlCmsxJ2ZRiQ_1780322532
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:35=E2=80=AFPM Stefano Brivio <sbrivio@redhat.com> =
wrote:
> I was thinking that if we implement a label like NLM_F_INSERT_LAST
> (David's proposal for the name), we could patch iproute2 to set it on
> 'ip address restore' at least, other than using it in pasta(1).

I'm not sure whether what I'm going to say is a good idea, or just a
plain stupid proposal:

By reverting the old odd behaviour, UAPI is restored, yes. On the
other side, userspace programs won't have any incentive to start using
NLM_F_INSERT_LAST, which is actually the most desirable behaviour. The
old odd behaviour is very error prone, as we can see with the `ip addr
restore` bug. That's why programs should adopt the "new" behaviour and
this will save them from introducing bugs like that one in the future.
And new programs should get the normal insertion by default, without
needing to read documentation or kernel headers to find
NLM_F_INSERT_LAST.

What if we reapply the patch and add a NLM_F_INSERT_FIRST /
NLM_F_PREPEND option instead? This will break UAPI, which is bad, but
probably not too bad per the conversations in this and the other
thread. Userspace programs affected by the change, like
NetworkManager, will need to be fixed, either by switching to natural
order insertion, or by passing the NLM_F_INSERT_FIRST flag to restore
the old behaviour.

Additionally, a NLM_F_INSERT_FIRST can be implemented for IPv4 too, at
least for consistency (I don't know whether it may be actually useful
for something, likely yes?).

As I said, this solution would break a few programs like
NetworkManager, but the fix is as easy as `if (ipv6) flags |=3D
NLM_F_INSERT_FIRST`. Would old kernels ignore this unknown flag?
Because, in that case, we don't even need a detection mechanism from
NetworkManager.

>
> But that wouldn't be enough for your case. At the same time always
> adding it for RTM_NEWADDR requests in iproute2 could break somebody
> else's scripts. I guess a reasonable solution could be to add an
> additional parameter for ip-address... 'insert_last'? 'last'?
>
> --
> Stefano
>


--
=C3=8D=C3=B1igo Huguet

