Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49EA2848B2
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770407846; cv=none; b=tHpg5kH0jSMv1bTTRoQaf5LjSqaFrQi0WsSgNUJio1YDQM2G/kq9gfplNHwWjFxd3KrQU3zevi6m66xewkKSwt8zTFoJjQi0UMMcSAt4bBZuWs3K2mahNw5e9OOjH38XuTp5SfcfhhhUBLBPZTASgKE4G8bZEaneom5l8GrQxg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770407846; c=relaxed/simple;
	bh=vM06iQYiR+l9HgUQLGCcT8TBUGY4NvnquYYYSbpiA0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9+DPQd5yUSGvq8NLfUR/QzWKxbwvLN7TSYDSHtpmW5odaD748QlKMQ8PS35f4pRBnLLl6bP83eKPDnwZK15X4Mv5qQOtIeSGOTOF7kJy5XkibIFp6kLZpLBZwwLPV2CoWAxZdV7iDHayO79F6f8aLe8z6ZRuTOP4vznwlbtCAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZaufPlXW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZaufPlXW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8845cb580bso173886566b.3
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 11:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1770407844; x=1771012644; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=24CeI2Q4AjFqwrn5xeXopiZwnU4/34xce4fExz113FU=;
        b=ZaufPlXW3aPadCYvZD672XpyLL1XpixTFkpM7O5E1jYf98D/H4bCffuODqGLNhAUjU
         3F9Q9C/yda4fx4+Tg76L9P7WeWfYBRfwliCK+KdPVRbNS14ymlPYzhTWF/s3eLGHCuxb
         rgIApr1HSYOoatW6stszrutLC1ZKG8DZwYRDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770407844; x=1771012644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24CeI2Q4AjFqwrn5xeXopiZwnU4/34xce4fExz113FU=;
        b=K9vFLGEa1k6n/jN/We+1lduIfeAORFGFOpTMa5iTSGyOIyFFi2pDW9Q9aHPImrwPvT
         e/3rDFSlL6lRsAo5RtD5nLsuz2omLwVHwtMLYKxwmqXUW4LmdRk9LGj9of6u8nwwPaIy
         ZWDUiBYSAuUAt/i+m1i8KBWiadpy56rud3VGtNjKRIJemuI5gxFyBqBM/kOLJmrqjNdA
         EwERaLWHPcMa2YPI3yu3x2/1Iecsa3x+yHIYd+WKcIPVLa+Xs3Gk8ycc+SO5dGqzdOTC
         3Ms07cTs+Q6RSNZC3i9mjDHWQgogsCXV8vmQQoUVY2mu+KQtr5egGvbg0vLtBGQllCaT
         2PbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx8Dk2K3LyBKbJ4lrhOs+ABEEiaVl6ltwTYXdnU0MOFR/NjD6jIYUHfkd9pTozrSF5jmGIxVroxi2NLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxM1nWXOqlV7H0CQQnDiu8KRx6k5KrYG3ZCxLS+zgDlz6NUcj8x
	p1CXZ7kUn175fcTLPOXxUX9re8ou/2kDuI5AV+bjYetVKWSxh0SOHK0xgAEM6w97G+XPuiUVvZH
	0+VkAobA=
X-Gm-Gg: AZuq6aIm8EfPNQwWIka8g80auCK4bM9wTdkX6FXqIHREGRlCXf6NM223dEo2Kb7pjsR
	0qCxrz2GKvHnF+78qKJW116PUQ3PzuArUYtNDDHBup/b6VlpQnJ+F5YuD7rZaihlhax6tZOp9zU
	z97NWxBz8z4dYPFODFcmDlqb/gRMQ2rCI9rdLUjgeHvq8fgeO2C3S9D2LMLI+AAehSXTeL2Mv4l
	1hExW3IiWKNsaqeMlrXMlPQpjoh275GDn2NnqUvSGNq/rKDmuC1+qwKII7x59kyiYIq/rfJi0JD
	C/zJCeWwgAjycwLM/k64kEGqVFrBHMtzwK6/oN1QN1KjRFNFgkCtVb+VwM7Acr/IAOd+5nnORTf
	wh1A+huO0wZc8AzAymCEomSEo9Ay3acfRl4rFv7JNB+sXmpeQ8FidbktA04EKMSEOLenP2EzQMZ
	FpVJdA+J4KGNet8ar7lsbRorBIFCBb4POpDbibfOhCiTJXTR2/+Laz9zYMjVoL
X-Received: by 2002:a17:907:3d09:b0:b87:756b:cfb3 with SMTP id a640c23a62f3a-b8edf1ea7a2mr218309066b.19.1770407843757;
        Fri, 06 Feb 2026 11:57:23 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3045sm109343966b.22.2026.02.06.11.57.23
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 11:57:23 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so1417569a12.2
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 11:57:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbgY09/O+NTRfTwSEUANY4HlXEgR6JLXeBQ57wPzgUf60FDMQJDthZ26FfpKjV1EQcyKi64NtL1lijow==@lists.linux.dev
X-Received: by 2002:a05:6402:2695:b0:658:cf28:90ed with SMTP id
 4fb4d7f45d1cf-65984138b98mr2250818a12.15.1770407843012; Fri, 06 Feb 2026
 11:57:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com> <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info> <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx> <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com> <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
In-Reply-To: <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Feb 2026 11:57:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>
X-Gm-Features: AZwV_Qh7YGikSEWRwVgtKILg04p3tR4ntVNFhNKDX4MzNWDB7lrS5R3czVXYKcs
Message-ID: <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@glx-um.de>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ajay Kaher <ajay.kaher@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Peter Zijlstra <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 11:08, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> Anyway, how about just adding RDI/RSI to the clobbers list for those two
> hypercalls?

Ack, that looks fine and code generation differences would be pretty minimal.

Mind sending a sign-off and I'll apply it and we can forget about this
unless somebody wants to actually clean up that vmware horror later?

           Linus
