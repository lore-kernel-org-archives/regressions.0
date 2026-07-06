Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B77416100
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362324; cv=pass; b=EO5VVlIQ3bYu1c1U7JKNYjs3SGmJ2FRnrHel/kK+TcZ3/0QUYPSsWvMLRSWbgwYG8wJsQQNSzteH4SjEzlGU0zlf7BlM4GHG2DtXHdOYj5Ofiy8Ws7m4Nbb77Q1LgJnfYmZ0y1Ck6q5tyIMlXyc0IlYXtitOxaD+tWavcwA055w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362324; c=relaxed/simple;
	bh=Cn4wawG4GsG/KOE07esR3I5RCnLM2n9QtBSsL+V5LS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttu6rhTTkWGZyTEazVQ5cVBLYygDy3c00tTCTCrowpDpLxjdFNGwcyTsvaUKaBo9P2y+ohEZ9zse0zXwxSmgEKZj1nTD06VvnTvKf0PP6g5RxT9MkqWDxtDCEa7owqxG4/oZAamUgeFCIR9ym/AAvbXFk9aBBFhh6svuV/MhQjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IREzfxtC; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IREzfxtC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698411099d6so2927a12.0
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 11:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783362321; cv=none;
        d=google.com; s=arc-20260327;
        b=hPtuWdhVjTkWyEviaNfk6+Dv5RlwHPW/nm43L0Rheu0WOr8yMC9M82lL7ySQp6c5cq
         gPkvTFOoVseeKwrncdTCGQxKjF4E0CioSL5XKO4rgtpCy8itN36BX0lWm5Fr5MxJm8IU
         z+kyROxxzhnArukb+Tah6EulUWzf+NyGlYYlHwgNIeF0RaHYOGeLgZK4UgMRZHkVqbRG
         D+R/i83ngB07u/D6Uwjj0K5m1Hfkq9K7ccEbfMFy3ZRoasa/X6EypaCy0WJvZet7nSPE
         lkKa+aLOkMNlnSM9KHRyKTNso70OpWWqfho7dYC+i5wntUTVCs8Rfvv/1KYbGaPTgcOg
         /pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cn4wawG4GsG/KOE07esR3I5RCnLM2n9QtBSsL+V5LS8=;
        fh=d/vuEbGK66cEDvHis73n9vRxl92Fi6hvzgvMuQ4uELI=;
        b=M4k1MKQBiZySueynUqsYDf1jK9hwtmsh6w/2ZJA13pjtQkcu8aGaySmT9vbSDh2R6n
         MU47mFTT6RSdwdg0yyJrSdLvo6z5N42fzu9m3PQkNffzvDQnhd9Cqf1Mu/LPFV5m0ZsU
         QzgNQrrG7UICPTaPDirO+uy6dlbO6LipIVU4qG1kGgIfjKnDUBBpNuPSjnGWBqMM1UFn
         MLXAFm9RNSRuYk+OsrNPWMstwzz7YYiJheIkuISumBR6yE4abhbnumc4Xd9hqQ2pfGLU
         +RW7lK0VX+czsiPboRkXp/QIB8BATz2Gl0PqHxTAU7PidnQvAQVWAbJGq7OS1jDPpMaR
         iBHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362321; x=1783967121; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cn4wawG4GsG/KOE07esR3I5RCnLM2n9QtBSsL+V5LS8=;
        b=IREzfxtC8Ee8okYX3MUWmxsb6JsL1oT5H+ov5iniUcQ2EoL6efch7XPdjUNXjvQEP9
         xp/8FCRb3io3tl9DtzqJUHNTs0L5rHcnMu+NRUka4G9nzMLmslrmB1Qg0OGPBaU1TRlP
         Ob66rUF9IDCL2tluL6b69HqGMb+tMt+2oZBT6lxdAs/pBqrkuXOCPC6yq+smwa0N4EqO
         Ow4ZCDcKA0PopdtXTOdbn7EEelZ0l4McU/BWg4msQ3zHQdtyjz1CpzL8RM8RCaQMjzWo
         0y1UWtNGOv12T1w1GM8+lr75wj+3HQleYy1CDgxI0f4ZY2zmqXIjXTqDH1j+Spx9X0cM
         MuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362321; x=1783967121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cn4wawG4GsG/KOE07esR3I5RCnLM2n9QtBSsL+V5LS8=;
        b=BeyPKux2sma25yQeuaO6U3jg4abcf+dfJICWkbR1NLlnJ2QNr5VAxBM+ZhPpqpXDJp
         +7Y/fOeQTzRcTN9Li6hS8+Iq5eL9aNRFH7Jcap7/k1yMxpR0HjBdhO6wUiFdPiDd2oMH
         HYHPQrqmavs6mjPd3sB4uaAikClq1Hix2aUmiATlQOLEfKhkkIhpGIWawZ2Qvuf4xPA7
         DxVq52R9QnWWNB3JEsZM832233YwQvYX+N5jYxgmQIqH88oQuyD2CfoJ37OgAAms6FdN
         jA3c2BPClS7/nlljl80SQa854D+TLY/H6AmP+KRVHtVZFemfysaYtRwghWZ3UGy3aFf0
         4ctg==
X-Forwarded-Encrypted: i=1; AHgh+RoYSGVEo9k347qNgr/G6Nw4QpOu08HOuZE+Nxme+O9eOumNWIvO5XjxkOsqCV5LsdWzE3+CspMGg4NNVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhRlPWIAAxoa1kUSx1NrHeEIHYM45RTKkuR9PhiWb5704MTelQ
	R5LSpBaE+J9fdNfHBXhvSJyQYOUGH3SG/ulRgrv0wqjczrTHDHWDYOeUSny62qzIjSzonpPJoHP
	yc5hrEa1/dZbqhg2vB4UhaS+A8HOTauJoUrVP1Xbn
X-Gm-Gg: AfdE7cmcmub24HUH8S/4Um3RVNoDFfvfZ5l/DacZTkfUp5/8rb7oakh2AIhrd95oAHS
	7zSASlazUNQTlHHET41fB2KZPeA3e8zCNgcY9BFSBGvyVMIIs84up01NR3opAmFo//XtMzBJCQW
	SKO160vf5+Ao2SfYeRKXIunFlAraLTeHWBmzrJOkU01ChNgjDXe+bXG16nxH97z+XOK2+C4gsCZ
	cL2/+xuhUdktGNkrxCpeVBGOfj+UvThGNIoiRHeScTEb5cxtXCuDgQP27EWR+rwu1erPFs/hQR2
	yTHEdAiP5QWq9GByoHm4nsjkWTLBZCI5d8JGpmLDWLOaXNHMYEFakS/I9w==
X-Received: by 2002:a05:6402:3045:10b0:695:4751:c044 with SMTP id
 4fb4d7f45d1cf-69a8d5af200mr12049a12.8.1783362321335; Mon, 06 Jul 2026
 11:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518-procfs-lockfix-part1-v1-1-5c3d20e0ac33@google.com>
 <20260706170735.2941493-1-linmag7@gmail.com> <CAG48ez0ebrMy8QGKLuz0Qwao_Eiav6e5pAJ5f6GrUPJLRkwNnw@mail.gmail.com>
 <CA+=Fv5R=mUW_p_AFFr-588F_b1hB=7RhMbtODya-gby=_fjBgg@mail.gmail.com>
In-Reply-To: <CA+=Fv5R=mUW_p_AFFr-588F_b1hB=7RhMbtODya-gby=_fjBgg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 6 Jul 2026 20:24:45 +0200
X-Gm-Features: AVVi8Cc7kCan3qAeIhO9q8vMrkV7_74C6sIMx7nz-yuT58X80UFcpE6GMOhG30E
Message-ID: <CAG48ez094Bu70b6CjfV4jGK+T5ihnprFY2wtBYa4AZf8iHJsow@mail.gmail.com>
Subject: Re: [PATCH] proc: protect ptrace_may_access() with exec_update_lock
 (part 1)
To: Magnus Lindholm <linmag7@gmail.com>
Cc: arjan@linux.intel.com, brauner@kernel.org, ebiederm@xmission.com, 
	jack@suse.cz, jake@lwn.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 8:00=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> I'll retest the strace pidns-translation tests once your fix is available=
.

I've posted the fix now,
https://lore.kernel.org/r/20260706-procfs-ns-eacces-fix-v1-1-a69ab14c02e6@g=
oogle.com
.
Thanks for reporting this!
