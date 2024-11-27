Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170AF200117
	for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722911; cv=none; b=AKdOr4pM/gt8lVPEKHgGkgW81/LONBUuLSeX1QDIBx61i5Hi0j/8wZLyDuoRtucmRSdMQhGE1pd+/MwTH9JBfdnMyQlUySh7fGQvKSZ4rElCYzAwReUzJCQv4fcVEJRGpjZfj/I3W0yDyDQp1fkALOlBsHZqO4dm9wzR3TdLIeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722911; c=relaxed/simple;
	bh=hYOF5+CSvFGGwMZxoKhXQ5ulU8SpkTAOXD2Ro2loI+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArffW3qgcwhkl2F3xlqOeAJ8swScexEeIWJnUisKJOSi0cU/tLs+y07T24fOgvf3xMmzWOgErpMuQTSBMd4EhgVXgHeD6YBIybkz11iYQb+p33iB+7/e9ubMLcem7Nkpn80foheZP4FKcXlzXVUr7pZ9Jc3q5bbEUH/THRZmkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Qgbuv4A3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Qgbuv4A3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38231e9d518so4541111f8f.0
        for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 07:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732722907; x=1733327707; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hAr4TZdsOU6XWFX8oKIJY4uIFZASuI0VfNTDSWNUv0Q=;
        b=Qgbuv4A354aFU+ec3muMQop5gx212LQ8vfmsbk76MYqq3kfEN5OS9wRQz3DlTddUjx
         yU2Vg2Y4OZSiwHXfTo7RKNiHN6c/VXbVZVKIab/vaqlKc8PD0OQUVzIOxNx9ZUswCRw7
         FnUNXHI9cM8D//Hb2SOB370Qv60LKJf6Hjn3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732722907; x=1733327707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAr4TZdsOU6XWFX8oKIJY4uIFZASuI0VfNTDSWNUv0Q=;
        b=QmtMdiczddcr+jTLpBVyPVqmgyMZDLp4pE0F/QHGIxb090KkLzFDIB5hGqnvT9yBOp
         Zq1Xmoib0JpacktOnJPDktiR+NktNgjfhplY9hIah4JleKvbGWTeqAbDldgBVQ7gTAFt
         tKAXjmB7dCSV1MD+jQ8pvuukL03s5EzvSCc507M5dlyZShBhQ8tw+b8nUtWOQx7h/gHv
         hCJ7vMKHPfCUvh/Gib5qI5DPSJjgI5LfcArFgZ45DeoohzBLGPj5VBa6qsjFYMQDZmfb
         5s7w2t+AYpVCFmmGzPkrlqY0BNASFue5fobzGVRryN4NhCLhgmOKfiyPpyi20uTuPCKD
         gZfw==
X-Forwarded-Encrypted: i=1; AJvYcCUFLBnPR8BLNGMYsjbYjXkCqIDdsfX9cqLx9OnXVq5JpRc5wDIyAMF2djpqO27IAb+/iMET3a4j6KNgRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGecB5qfun2yvwG6ZdvIangNSBPNGopl2vPg2WzOjIhiLbgNsl
	WjIDdiRDCjyCR6PBYIsUP51CYBezwxjKIyDlHH1CMH9QXhSeLFeupQm4GksnGYBgXITDFnMrXxf
	OWPE/Mw==
X-Gm-Gg: ASbGncvZ8jaVBBZRnAWqtRU9KkcuSMxA9VZEpj91jmRvc4OLqFR3PWC9r+22Ms6XlAO
	PmFIMRpG5A/9Fn8Nb+KdiiaVkLxVJNSTi35/jPn+pVBf9xoduSrTCiODhCFI4QIfSgPw6eDm7+s
	3n5iJVdO9Qt/OWl5ctYo5Sp2Xr6JpENZzybV32Fm0akRSl9xUPJkubjW6+4Co+mSlPfKADVcMPb
	51CsJIS3AhKMAxSajN9Irr0l69w4rUEaXB3Cseotv1MGpyQ9/OR0CU4S1w/vn8/Fk+j5cblMeVo
	m7ZQVlQbFaemhq2cw9+OUKri
X-Google-Smtp-Source: AGHT+IEnD+Fo/pQqlR8UPDXQa7MRhog9+KEbQDiYnTeVBzImavEdGcEGs/TVpvBEQKnqezrYUHT85w==
X-Received: by 2002:a05:6000:18a2:b0:382:4485:2dae with SMTP id ffacd0b85a97d-385c6ebefd8mr3312445f8f.25.1732722907216;
        Wed, 27 Nov 2024 07:55:07 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3a3407sm6192806a12.17.2024.11.27.07.55.06
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 07:55:06 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cfe5da1251so8372155a12.1
        for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 07:55:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcGreye+gbO19c0V1WLKJQoWc+JuGbmP0wef7Y8NPlAmRGoOxK+oYdwyqOK9uP9iddnb6mewx2KmabJA==@lists.linux.dev
X-Received: by 2002:a17:906:30c5:b0:aa5:1b7a:5579 with SMTP id
 a640c23a62f3a-aa580f202d9mr211472566b.21.1732722905907; Wed, 27 Nov 2024
 07:55:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACKH++YAtEMYu2nTLUyfmxZoGO37fqogKMDkBpddmNaz5HE6ng@mail.gmail.com>
 <4a2bc207-76be-4715-8e12-7fc45a76a125@leemhuis.info> <CACKH++YYM2uCOrFwELeJZzHuTn5UozE-=7PS3DiVnsJfXg1SDw@mail.gmail.com>
 <20241127-frisst-anekdote-3e6d724cb311@brauner>
In-Reply-To: <20241127-frisst-anekdote-3e6d724cb311@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Nov 2024 07:54:49 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi+3qEU9S9sgRLesCMKJ1w_e6zwEt0f30=8NSKhN+2LjA@mail.gmail.com>
Message-ID: <CAHk-=wi+3qEU9S9sgRLesCMKJ1w_e6zwEt0f30=8NSKhN+2LjA@mail.gmail.com>
Subject: Re: [REGRESSION] mold linker depends on ETXTBSY, but open(2) no
 longer returns it
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Rui Ueyama <rui314@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 04:11, Christian Brauner <brauner@kernel.org> wrote:
>
> Linus, it seems that the mold linker relies on the deny_write_access()
> mechanism for executables. The mold linker tries to open a file for
> writing and if ETXTBSY is returned mold falls back to creating a new
> file.

Uhhuh. Ok, unfortunate, but this is clearly a real use case, so of
course we'll revert the kernel change.

           Linus
