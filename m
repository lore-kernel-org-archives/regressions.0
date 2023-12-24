Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04F18F
	for <regressions@lists.linux.dev>; Sun, 24 Dec 2023 00:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjwD1QnA"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5942c83c97fso1772015eaf.1
        for <regressions@lists.linux.dev>; Sat, 23 Dec 2023 16:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703376480; x=1703981280; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH/XJuSscVimadN+6htDE4Pbf9Ag1leUGBOfxxjvsqE=;
        b=YjwD1QnA77MPEaePFbvEsPlDQYhmuImPEm2sE2BQRW88yyhamiWMxmUgXzEeNgWtBE
         ubGlUksZ7kOZ+6mApkc1f20rfF2wsAmVENgpipwhlIX5jpHNOwb35/w4RDmWtzzp6+QQ
         YTfJjmlSNoDQbIArasoyt+s3VO/nydM6NVOivnZYDKYuCETO9PJ22BiPLpoEtowM5I4u
         7BDj/KIsXL+XAzuAu3tSjQY4jbaqnM0I2xNtRC6KdGap7BgQMiuYWHZX7FsrvV7Ag3IW
         8U9xbfT/CedZtVqSLz+faeFZVjY84WKDAIyZIlhwRKaODJosT4KNATvlOHQwLhUcfRCk
         vFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703376480; x=1703981280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH/XJuSscVimadN+6htDE4Pbf9Ag1leUGBOfxxjvsqE=;
        b=KVqblmjc1Z+T9FQrYWk4ydRZdloYfO7lqXE98NOq3IX9O38J/rl+deD9o/4IvkFqOp
         ugUUkEFuDwrE4hRTO2YIAFx5cb1ETgMu/ojZyXHFNvDzpajwM8bi4SXhtdX6Lkmv31qt
         jMqripQSHo55ebBVboqtcK/LhkOtRG/kwGjl/xh1EOj+aoTWMuciHstBPSSkL99oDIFj
         01ERQJKfRg3ElAeJhbpbt/5UWKxRSCAW/+fquR/dcBdjfn4l3KgTectsWBbvl25n9ADl
         zCpWG3ri0/AgzplZDSKS+rUoFroaOW3EfzkAwDsrTZzxc5OPwbysV3MuF5aZJCQcE+pG
         JBqw==
X-Gm-Message-State: AOJu0YxfhnsFgThjn38bHsWlybmP20RslPO77n55UomQiw/l8aAIEE8Z
	BehD2l7M7s9SG5h0KNbP544JrJvZ2UKZiL07vB8=
X-Google-Smtp-Source: AGHT+IGmruJyaWFI9jMngVnqF9R+SWkg/WC0/VLm5IuhmrIjbtlLlauBGchbUe19YPqx/v124ZPs1r4WRaMTrP2SSfQ=
X-Received: by 2002:a4a:8c61:0:b0:594:5bbd:9acb with SMTP id
 v30-20020a4a8c61000000b005945bbd9acbmr521758ooj.2.1703376480317; Sat, 23 Dec
 2023 16:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231222234237.44823-1-alexhenrie24@gmail.com> <20231223152235.15713-1-dan@danm.net>
In-Reply-To: <20231223152235.15713-1-dan@danm.net>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sat, 23 Dec 2023 17:07:24 -0700
Message-ID: <CAMMLpeTCZDakqdkxm+jvQHxbRXhCYd4_PK+VVqMAmZHjSPuPRw@mail.gmail.com>
Subject: Re: [REGRESSION] net/ipv6/addrconf: Temporary addresses with short
 lifetimes generating when they shouldn't, causing applications to fail
To: Dan Moulding <dan@danm.net>
Cc: bagasdotme@gmail.com, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2023 at 8:22=E2=80=AFAM Dan Moulding <dan@danm.net> wrote:
>
> > Sorry for the unintended consequences, and thank you for the detailed
> > explanation. Does this patch fix the problem for you?
>
> Thanks. I think this patch may resolve the application-level issues
> I'm seeing.
>
> However, it looks to me like this would still violate the RFC. The
> temoporary address' preferred liftime must be lower than /both/ the
> preferred lifetime of the public address and TEMP_PREFERRED_LIFETIME -
> DESYNC_FACTOR.
>
> These two existing lines ensure that it will meet the requirement:
>
>         cfg.preferred_lft =3D cnf_temp_preferred_lft + age - idev->desync=
_factor;
>         cfg.preferred_lft =3D min_t(__u32, ifp->prefered_lft, cfg.preferr=
ed_lft);
>
> Once that has been computed, cfg.preferred_lft is already at its
> maximum allowed value. There is no case where the RFC allows
> increasing that value after doing that computation.

TEMP_PREFERRED_LIFETIME is an administratively set variable: The user
can change it to whatever they want whenever they want, and the
operating system can adjust it automatically too. It might be more
clear to increase cnf_temp_preferred_lft before those two lines, but
the effect is the same as increasing cfg.preferred_lft afterwards.
Unless there's something else I'm missing, I don't see how this
approach could violate the RFC.

> I think the safest thing to do is revert this change, and try to find
> some other way to achieve the goal of preventing the user from
> administratively setting a preferred lifetime that prevents temporary
> addresses from being generated, when the user wants to use the privacy
> extensions. For example, this could be done where administratively
> configured values are accepted (wherever that is), and either generate
> a warning or reject the change, if the value provided by the user is
> lower than REGEN_ADVANCE.

It's fine to revert the commit for version 6.7 (after all, I think
everyone wants a break for the holidays). Hopefully by version 6.8 we
can agree on a way to support users who want to randomize their IPv6
address as frequently as the network allows.

-Alex
