Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587CF1E3766
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551635; cv=none; b=gzeEshsfNElr7A8CHw3qNkdFXyEtk4jbF4xMSKx+QKMZIIWtLB/a2+jLpaJov2xAkqxqm+8x+1UwMCZ5YbTrtyyyV0sikP4rS6N05hIj3jaLRhr2q8WPyYENG6ihVNc0LIaTGK5sJ+nh7wCkju/yVxA8xtt1UvE7dw4oPxbcGBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551635; c=relaxed/simple;
	bh=3LeeyEafeXaGnkqTR7YkYuS9ctyqOUkRKIdPORL0JMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kz59u6T+sL+ilJ+8KMutM6+Np2/EsRC26wG72yr7KWXsNTfXnU6rcZDzeiJqvbHA/iIf+LhBRrKH77c+RxP29pFiEx3hWTlWXSOpvu6XodmhY9wneRrJdSmB4HAbDpzNsFHQIVtnh8GmM4AUZXmYh8swW/nhlxXJ8vaVZKQ5eW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eGKMZY5S; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eGKMZY5S"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso684697366b.2
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729551631; x=1730156431; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rZmK1iIL6psL/Ic0R5BQSUU9uDtSN6VQwETroA+PQ+k=;
        b=eGKMZY5SAoa6WTIh8mY1EMq9jA6od/qa4VEBmjq08qBTQP8cuhGEq4jjV7Nja36g4d
         BHFVLC+xGHSmTxSbmwdSWr9WLSShZDnbst84ak8c/++3BbKUR44fHAPCKL4zbUsmbOGO
         YyvPCnXLYzo5ZD3IR7hXFl433k3YGWue9zbmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729551631; x=1730156431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZmK1iIL6psL/Ic0R5BQSUU9uDtSN6VQwETroA+PQ+k=;
        b=xDp8W1JgdUGUlQI7ORTDCdNUxu5pvOid6A9F3f9Z6sguHhzUd7VY277hlqTGgZL7mH
         htmogwa2UNP2aWxzmDffHkkQSVug9zoiPeBb2KTBFd/78dSk88kAZEaKwVCIYYe0tHDy
         KuZS6bMomPWN5QQp/+JNHD6tOdvObQvyXlWpcJIovd5C23yFrSJkcb5BvZ//OTGVnvGf
         eyUHQMJRK7RA6wdeweKARQoX3YNpF1heLbHPei64Ux3blu9nSBDLxaKp+gQqeYEH3KtJ
         kXgt7HIqZG1hzP0J36v47jWCHDvLkiq6ylpwu5g4pdR299VS275KEbzaLQSutKQiYrFG
         NXIw==
X-Forwarded-Encrypted: i=1; AJvYcCVGG8AYr6rp71YdNeluWamBTmOEuDtD5lIqz+PNijel8tpsyDnwjG3UtuvUPE5ivF3qTSqyvSOT9s47cA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLBktSVixzBnrKCx60Tsd3+aEpylh32B2Wi753TXRCEiF2kebB
	/lFYa/NjZXELiywK02xGi/vpjvh3i/M3327vqmVmrDg62veuwSZABDIgC4Kc0pEkk9jov4/8bxg
	hOhgBSA==
X-Google-Smtp-Source: AGHT+IEQw7LKDywGALzAs3XoAAQChzUespHd+oynOcHp7QrLcvSkwySel13LACMf0VH/wyJq5/ElVQ==
X-Received: by 2002:a17:906:7312:b0:a9a:123d:3f1a with SMTP id a640c23a62f3a-a9aace39941mr43030266b.17.1729551631448;
        Mon, 21 Oct 2024 16:00:31 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9137074fsm262694666b.135.2024.10.21.16.00.29
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 16:00:30 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso389406966b.3
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 16:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5cluXNowEcDVso4OMLBccdi+rBru/dmtItDEXg4iuqLAC5EPPLeOVXlzWB+e7LwmGSdDLwA93om2T9A==@lists.linux.dev
X-Received: by 2002:a17:907:97c3:b0:a9a:4e77:92f with SMTP id
 a640c23a62f3a-a9aad3d659bmr42656766b.56.1729551629565; Mon, 21 Oct 2024
 16:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807094725.2193423-1-pedro.falcato@gmail.com>
 <20241018172804.GA2151929@nvidia.com> <CAKbZUD0Z_Kyumx3ourywUYhfksGNgJWrCpjAdnxtsbwS4vMRkA@mail.gmail.com>
 <1cb07628-269c-4d6c-9936-f3a2b233165f@leemhuis.info> <b6852c2d-3371-47a4-bfeb-049f4048e88a@suse.cz>
 <ZxL3FsmjGrTT_EV9@codewreck.org> <d937fd92-249e-4660-a59a-ee85b6ec4691@suse.cz>
 <ZxafcO8KWMlXaeWE@telecaster.dhcp.thefacebook.com> <CAHk-=wjpxeTifM1LFPQFR5_RjD2uvDAHbZ-ATCqox+RuFwkbDQ@mail.gmail.com>
 <Zxa0K-4mhSI91S-w@telecaster.dhcp.thefacebook.com>
In-Reply-To: <Zxa0K-4mhSI91S-w@telecaster.dhcp.thefacebook.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Oct 2024 16:00:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiBSEzzC2CTtTgnJ-ou+1ye7CVw45ogeH_eFR_fDF=Z8A@mail.gmail.com>
Message-ID: <CAHk-=wiBSEzzC2CTtTgnJ-ou+1ye7CVw45ogeH_eFR_fDF=Z8A@mail.gmail.com>
Subject: Re: [PATCH] 9p: Avoid creating multiple slab caches with the same name
To: Omar Sandoval <osandov@osandov.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Dominique Martinet <asmadeus@codewreck.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, v9fs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Jason Gunthorpe <jgg@nvidia.com>, Pedro Falcato <pedro.falcato@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 13:06, Omar Sandoval <osandov@osandov.com> wrote:
>
> Yup, that works here.
>
> Tested-by: Omar Sandoval <osandov@fb.com>

Ok, I changed the '%d' to a '%u' (because go big or go home), and applied it.

Hopefully I didn't screw anything up in the process.

              Linus
