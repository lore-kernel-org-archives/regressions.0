Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A03D7F
	for <regressions@lists.linux.dev>; Wed,  4 Jan 2023 00:57:30 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso23210198pjc.2
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 16:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:content-id:mime-version:from:references:in-reply-to
         :cc:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq1c/AvLXgc2roO2z2plGhlTBLyuyX2cMgq0YW/fCgw=;
        b=qZ5jUlUANmMS58r1tOTXY8wBwc42KTBdlWAQWfX8z0ssl5FM4/DMZgkRGUq67yIfVU
         3jb0rXFvZ+BKQVXek50mKgV3hz6ILc3XpBr8sRGwmAPk3pD8z+2OURwl3hrXfDU52COu
         4RsD7qSybb59H6P1xwo4T2dlQeVy6H8r0ajUb7VqmXLo1IltP3sM49kQLkAuHknyOLk0
         nGN883RkJGZYQDpEwfRYBE71uNVl6uLhlPhwGy1ie4UYV+aHlvO8gwIgwgbUsNY1av+X
         Sd4mCmzYSvFcWpSEsa8CWQQLjM6EaKOeUd/QWA2uCgoAEKJ3IA3LqXXjpuqGo1n5IRXu
         dnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:content-id:mime-version:from:references:in-reply-to
         :cc:to:subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq1c/AvLXgc2roO2z2plGhlTBLyuyX2cMgq0YW/fCgw=;
        b=z/dmHqUa906IxcKBUAmBlz7ZsoKpygb/z8KOFqZ+MWeKhHAbNjc+0OtVMct5xGRwl5
         rLYurOlBoNtipwsADvXKK9W7LCQFDn3gRgAGdnhVGsAMknDzOsTwVHPnjsxvtvxGQgXj
         zZJxuE+Zaz1pCggXRRwmigTMa4ECo9s8nlhy/ARM2qm6dUtvdTSTET0am2v2AKv4fAuz
         0mugqCJ7xMw1r03vKDACiVEP0gS+WQiTQPEgZ5c5jB35pFBY9eqj4k0Ory32GOtnxZiB
         HekmXTTJTdgoPyVWklJ6+qV5xG/nyaoRhXcI8NrJyaZ29cPppeQu1bmFgbHoLwoYQX2E
         MTow==
X-Gm-Message-State: AFqh2kr0hSFuhXuw98Xibz+jHOMBhz2o/pJfNTEdfMofmpuNTMrw5U71
	bE9pV+xEaobb0CErLSF6lIjGT9q6jRs=
X-Google-Smtp-Source: AMrXdXs4s9Lz0A+N5j+kqLcZfgXZcOBuL/993XjEjkBa+JrfKiBCKrzpRFobfm7nwW89cc1XSEwTEw==
X-Received: by 2002:a17:902:8c8b:b0:189:c536:c745 with SMTP id t11-20020a1709028c8b00b00189c536c745mr49691160plo.2.1672793850400;
        Tue, 03 Jan 2023 16:57:30 -0800 (PST)
Received: from jromail.nowhere (h219-110-108-104.catv02.itscom.jp. [219.110.108.104])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902f60a00b00188fdae6e0esm7368698plg.44.2023.01.03.16.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 16:57:30 -0800 (PST)
Received: from localhost ([127.0.0.1] helo=jrobl) by jrobl id 1pCs5w-0004Ns-J0 ; Wed, 04 Jan 2023 09:57:28 +0900
Subject: Re: [GIT PULL] acl updates for v6.2
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
    Thorsten Leemhuis <regressions@leemhuis.info>,
    "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <20221227183115.ho5irvmwednenxxq@wittgenstein>
References: <20221212111919.98855-1-brauner@kernel.org> <29161.1672154875@jrobl> <20221227183115.ho5irvmwednenxxq@wittgenstein>
From: hooanon05g@gmail.com
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <16854.1672793848.1@jrobl>
Date: Wed, 04 Jan 2023 09:57:28 +0900
Message-ID: <16855.1672793848@jrobl>

Christian Brauner:
> On Wed, Dec 28, 2022 at 12:27:55AM +0900, J. R. Okajima wrote:
	:::
> > I've found a behaviour got changed from v6.1 to v6.2-rc1 on ext3 (ext4).
>
> Hey, I'll try to take a look before new years.

Now it becomes clear that the problem was on my side.
The "acl updates for v6.2" in mainline has nothing to deal with it.
Sorry for the noise.


J. R. Okajima
