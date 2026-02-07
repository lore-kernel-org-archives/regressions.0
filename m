Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921451B424F
	for <regressions@lists.linux.dev>; Sat,  7 Feb 2026 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770426327; cv=none; b=oshM7140/0jlyzpvDUx5FWXZxzrZXTOFCY3MyIxvj87JyHnLy2BG6mvox4oAKHKJm8Sp2dD/vmgEz9/b/fy1e9YDA/fOJ+kBFDPMFGk4pVp6HCyUVpzsbXu+8y6Y5wG1hQMIS6D+GsPgM/APV+ZQSCdcwxR/ZdCGUEDNOxMV2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770426327; c=relaxed/simple;
	bh=DyEwy7KNhImfeAIgtl1zFOs2mZfJXBxqtKMPFFtToRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+QsaFPcuEcwxBkXOIbMOTbtNRukBhuMo9RvR6k//ikCm+EicRTjBNUkq33ZSt4xvtNQWC0UUvtU7dsHFrsgzXO9j916YGSCQTATWRpW2yCus4PoPfFctCH/hGl68AJ9JrMpR+eXvKm3ZPvs/PH4QnOY0PvzyLCKT7m2Qn0/6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eDC4UJjU; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eDC4UJjU"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b883787268fso196038966b.3
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 17:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1770426325; x=1771031125; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lXW00YCWOjNKt4h4JIQxpdrQ0ELr/Oyg9sC+YUrvZ2Q=;
        b=eDC4UJjU2LPMe2t2W+Sm8oXrmI6sqxWb22jyQVtOQDASOyRe5uUqd134NQ34W56Zm1
         5nHOhvzRYdxqNT0DFiAntWosx6eJ5MfPzwHM2xQ9h+5VUeRJxeIef0bKvOLY+QQIBPok
         689YAZB4wxdwqeVCahNFheB+YwkCVG0tRaTUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770426325; x=1771031125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXW00YCWOjNKt4h4JIQxpdrQ0ELr/Oyg9sC+YUrvZ2Q=;
        b=HLzp9mwaroHApOm2fMvWporyZqrEV/WFlvOqrPMnG/UFYPhxXk/MrIyHhbgn5I1uC0
         6STiLb9m9rvH28/F9icosUWYz2OTy4cCONg9U5BMcL4Vn9JZmfeaYA5yBrRXFwg5uvys
         T/KON04KVJEX6Uauc+ZrgMZOTJsAs1TW6Bk42UhiHOS4PFzX4mNEAw9vwNqU+WhmG8Wg
         CCphiv9Zv7lQly+5TW3mdHnNx14Y5kdcsXbCx/44AtlGyAnJy84/FjoRheAlEf4HQrYp
         Rk64qPyGA1oQD5gEYdbW2bh7FvgPVQw/tflHMxYbjpJXERaIhJIk6t7thqg7+1bXP0WT
         zI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWR96+TZ0wzWUASOl015DwoohOZnBajf14OimT1Y+tu6QIVQfiAKcbUEmcS7gbwXnWGiN1v2fvvfxubJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyF/BgqqGOXGw/PkP1uUVLFG7TI9XAdZ8jS4hBKGrohsscG+5GG
	C44Ui+D4IekhDOeHpce58qhf/IdCwZCOyqLU0L+k5WJIMeKYBrOHvUzudf7zASXB2pqgqvDg277
	W6ErgfU4=
X-Gm-Gg: AZuq6aI3CXiQ0UvDrM9xWCZdHMPXQMYJviS7Y8fGOMliCBefX/Zauk+45ydADOe+Q6c
	h1ydyHmbQtGZqIKohb71FjqsjHZeYWrIswa3WTqUhZXVOrtO8rGYt85fkD1wxxP/TOx0EBz4wA2
	Y/ClsJ4MMJryRLSrYZ9i8gPL/jGHuHDQcw68jJoQwOycdQGnGxfeENGTO0keHeWDIFozFwyw5ut
	mFw83jhogJdg2muYAWo1EZWWaTU68HhhoNqxLTIY5d2C7+neoOeiS0Dbh0HNcjhGfAePG5uoD1R
	q4moHF8yhiTHg/Qb7JKR2wZ5CyrwYA7+qod9ROWuI43G3Et7xP9PI4lMHd7QTQiiPhrpGYWWx9m
	yw5CkK8HJ/VEhO6iFyD0aRAteUTXmHrkUFRLonsWjZPZwoyHRb6AXxDzkax01C1MqAfUM2XBMKn
	mFpSV9yvhsZBQS+4ZSPd3VLFSEXYCNsumIHHDTq+EMEypmT2YXQLKzvYlKu3RD
X-Received: by 2002:a17:906:c10c:b0:b88:3bb9:e2d1 with SMTP id a640c23a62f3a-b8edf37741dmr282687866b.60.1770426324673;
        Fri, 06 Feb 2026 17:05:24 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf1540sm125198766b.56.2026.02.06.17.05.23
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 17:05:23 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-658ad86082dso1727721a12.0
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 17:05:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVS6ZmQYA87C2D9NU9s0PLoac9sErebSTCugA5HU63S58TxPqSPOZQCEm2ibBO93QV3K7SzMA9oStgr2Q==@lists.linux.dev
X-Received: by 2002:a05:6402:2690:b0:659:4d41:9f4e with SMTP id
 4fb4d7f45d1cf-659841477b5mr2132313a12.11.1770426323247; Fri, 06 Feb 2026
 17:05:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx> <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
 <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
 <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>
 <nchtwtwjqwm444au4rsojawomqslolr3hb4ao4rwsi3t7hqawe@ktggphxq2rhd>
 <CAHk-=wjzFZMAoJkrOg7LWsQcVOuZhOgMFWGC-sBHOACE8B4+Mw@mail.gmail.com>
 <CAHk-=wjEwfcj6DWWh8mKr+O4ospkfNSC1GAvAcwfWAUAyTRq5A@mail.gmail.com> <cwxcn2oufcpvzenyicg27umr3gbuow26ufotfhck6vauxyqmam@e6ssitydnafx>
In-Reply-To: <cwxcn2oufcpvzenyicg27umr3gbuow26ufotfhck6vauxyqmam@e6ssitydnafx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Feb 2026 17:05:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=whSPdiu3bSd25FUdYYSbSiMy3+Uy223j4CN1qNCpgvprw@mail.gmail.com>
X-Gm-Features: AZwV_Qhwb_QPoBs3EDHffQM4qbDwQIqKnpiBjDDVMmgdU4HJClunhaexO72jN38
Message-ID: <CAHk-=whSPdiu3bSd25FUdYYSbSiMy3+Uy223j4CN1qNCpgvprw@mail.gmail.com>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@glx-um.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Justin Forbes <jforbes@fedoraproject.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 16:46, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> (using uint64_t instead of target_ulong at the maintainer's request as
> they are phasing out the target_ulong type).

Ahh. I'm reading emails in the wrong order, this answers the question
I had about the 32-bit host case..

            Linus
