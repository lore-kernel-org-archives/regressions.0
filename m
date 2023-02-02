Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAFF3210
	for <regressions@lists.linux.dev>; Thu,  2 Feb 2023 15:08:59 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id c2so2116720qtw.5
        for <regressions@lists.linux.dev>; Thu, 02 Feb 2023 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2E9zn+ToMChqAJjV6ZutpFgHJwReTtRL04XKbEEuVxs=;
        b=D49Pub0oFsmtKDM+i0yPx5so8Ey3zPdGciQUAqRywZib+NU6H7wy/1YeZxnSSJ900T
         4VlJ8WBppvk/tgpBZI2WF/NTs+72iuBZhDamCm8/kkdFDmhX4QVCQRWiosDors4rb9Sg
         TLM5pGFd53nuEIkcDqCPeJ3klihOCtUuW0c+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E9zn+ToMChqAJjV6ZutpFgHJwReTtRL04XKbEEuVxs=;
        b=VbKqPjB5nUTq5y0zds5Yk28gY2/4Ho++0LIyHe2seceBx1HDqia+R7UZye2tNDSfyH
         aLXrWpIjpmEPgsaxMDuB+psBJlqbLn2cYLAE+0tFl87bgpzbXJh3Kgw4xO/P2bL3l+Vx
         Wgje8TfWw/DZy5BDiJkIIJiRoDZrQZKRjvw0k3ymGGko+0otIlgaTMKJ7+8+kdqDoTeq
         KTdROzlR5dFBXF5b5r0adR7DYtZyXqC/kzF3VsuJyH70SAQaccy9wnE4peLOUicb8hq2
         CHdZHLSv1/IiWqeSjYj502JsfIgmqIZ2M7pzcnCDlFuo3wSuGGNfb+2bpsVaNq1M0eH+
         3Xjg==
X-Gm-Message-State: AO0yUKU+Zz9U2stxJJYVX0z5fk64EaxatR79gdBwXGwdw7mQ7nECPbUW
	VQTY2Rt332p7wWNOjPiXgh/wrVqIxbg6Pil0
X-Google-Smtp-Source: AK7set8aPKmpgGjXY3zfRDCd5eMrn6Kx/DhIpyqMfqTzahBlYTampPz0k3hZtc5+Tdob1MQmTWPEbA==
X-Received: by 2002:a05:622a:1998:b0:3b8:3a7c:d204 with SMTP id u24-20020a05622a199800b003b83a7cd204mr12152621qtc.58.1675350538326;
        Thu, 02 Feb 2023 07:08:58 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id u15-20020a37ab0f000000b007049f19c736sm1521378qke.7.2023.02.02.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 07:08:57 -0800 (PST)
Date: Thu, 2 Feb 2023 10:08:56 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
Message-ID: <20230202150856.lchr76nqih3vdul6@nitro.local>
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <1f217c94-b90f-359a-2142-0d3ae5d84fc6@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f217c94-b90f-359a-2142-0d3ae5d84fc6@leemhuis.info>

On Thu, Feb 02, 2023 at 12:15:36PM +0100, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> Then I tried creating a shallow clone like this:
> 
> git clone
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> --depth 1 -b v6.1
> git remote set-branches --add origin master
> git fetch --all --shallow-exclude=v6.1
> git remote add -t linux-6.1.y linux-stable
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> git fetch --all --shallow-exclude=v6.1
> 
> This took only roundabout 2 minutes and downloads & stores ~512 MByte
> data (without checkout).

Can we also include the option of just downloading the tarball, if it's a
released version? That's the fastest and most lightweight option 100% of the
time. :)

> Not totally sure, but the shallow clone somehow feels more appropriate
> for the use case (reminder, there is a "quickly" in the document title),
> even if such a clone is less flexible (e.g. users have to manually add
> stable branches they are interested it; and they need to be careful when
> using git fetch).
> 
> That's why I now strongly consider using the shallow clone method by
> default in v2 of this text. Or does that also create a lot of load on
> the servers? Or are there other strong reason why using a shallow clone
> might be a bad idea for this use case?

As I mentioned elsewhere, this is only a problem when it's done in batch mode
by CI systems. A full clone uses pregenerated pack files and is very cheap,
because it's effectively a sendfile operation. A shallow clone requires
generating a brand new pack, compressing it, and then keeping it around in
memory for the duration of the clone process. Not a big deal when a few humans
here and there do it, but when 50 CI nodes do it all at once, it effectively
becomes a DDoS. :)

-K
