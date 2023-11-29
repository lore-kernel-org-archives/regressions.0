Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD9125CE
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOSd82bf"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7c51c5bc44fso304515241.3
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 00:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701248394; x=1701853194; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XBUUYQft2seUnlUM4OmCBERBIGRIw1M9PaGf8BE6/Yo=;
        b=SOSd82bfCl/4EPoOGrFl5gNMMTy0v+eOftEbqQLLw6h6UNWvlE8olYo97z0ZoleOsN
         foEFW724cjb3J3s3SY9Rwh9nYsjWV0eH+aFtoFbuwq4obPLwB0exWEhsB1d5lLtX7iXV
         ACDOMlDaW3O4EzbmZYWvEqeREaxF+24pgwaFwQKivEiJSMuVW8zcyVsoCvS8GsRPZQqM
         WS8BbJM6TX7DmT+9CseimjQuPs47Vat39xD5aUOpBH2O16QjccN8gjEobx6VjlRhzVUD
         keSQgiz/ocFuhLban2mZHCHldIwVkqSJaxh34BF2LDRgTgBaez1zvullfZ6mGPO+jWg8
         Aq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701248394; x=1701853194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBUUYQft2seUnlUM4OmCBERBIGRIw1M9PaGf8BE6/Yo=;
        b=lyw9PvoVsOhaxqPzbpSTJ7UYXsjmotGW8y6IXoFCBUkF1IQ6CqkPQbqY8ftdMu1DMg
         iYWKzqA1fZkNg/m+IIfPiEP4mYslUzVus7uaJKgjK4s10ifKRbp8zu4rMKE29irIOH77
         kps/j3E4Riy1FSk0Y6IgK2u330/s3nFsKO+MSkbRMuuZYBzizOkixzTc7cf2EDsu7PVL
         64Y7K7fwUWIpU3pcGY2x/uk97d2VjC5UToV9S5DDVdNh1vm7xd76qrnYaRcNNm6M3IvI
         zzMBNJKwXunNWYdmVCb4SxUe9V0Yz/UUtV7lAjATCKpGBgaOVd/zQ2vc3+c8nygxX2NP
         O3Tg==
X-Gm-Message-State: AOJu0YxDgv+gB1sJxe8JIKm3tzyJA1YHvwrhNZul6tswePJcQuJvR3Nh
	jcGMP7Jl60S6OIQmfyWa7/16NKPW0nFNlxHZYnKqbA==
X-Google-Smtp-Source: AGHT+IEAiYKsp8cH+2h3D9JtZpHKKIWvy5a5Q1QY0jUFvGMVWmqKhCUBJBpd5MooxAaQp9G4F38UYjLP10jlxrC+JuY=
X-Received: by 2002:a05:6102:415:b0:464:3c0a:fdd4 with SMTP id
 d21-20020a056102041500b004643c0afdd4mr4191842vsq.2.1701248394003; Wed, 29 Nov
 2023 00:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvbCBUCkt-NdJ7HCETCFrzMWGnjnRBjCsw39Z_aUOaTDQ@mail.gmail.com>
 <ZWbjXV85zDXen_YH@archie.me>
In-Reply-To: <ZWbjXV85zDXen_YH@archie.me>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 29 Nov 2023 14:29:42 +0530
Message-ID: <CA+G9fYtByCCzrbM-a4du2b5rJVn_UaCz1HaMZMcBAcfyUBXPSA@mail.gmail.com>
Subject: Re: btrfs: super.c:416:25: error: 'ret' undeclared (first use in this
 function); did you mean 'net'?
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Linux btrfs <linux-btrfs@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Nov 2023 at 12:38, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Tue, Nov 28, 2023 at 05:55:51PM +0530, Naresh Kamboju wrote:
> > Following x86 and i386 build regressions noticed on Linux next-20231128 tag.
> >
> > Build log:
> > -----------
> > fs/btrfs/super.c: In function 'btrfs_parse_param':
> > fs/btrfs/super.c:416:25: error: 'ret' undeclared (first use in this
> > function); did you mean 'net'?
> >   416 |                         ret = -EINVAL;
> >       |                         ^~~
> >       |                         net
> > fs/btrfs/super.c:416:25: note: each undeclared identifier is reported
> > only once for each function it appears in
> > fs/btrfs/super.c:417:25: error: label 'out' used but not defined
> >   417 |                         goto out;
> >       |                         ^~~~
> > make[5]: *** [scripts/Makefile.build:243: fs/btrfs/super.o] Error 1
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Links:
> >  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/log
> >
> >  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/details/
> >  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51BFjRBS06YQ3U/
> > - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51BFjRBS06YQ3U/config
> >
>
> Is it W=1 build? I can't reproduce on btrfs tree with
> CONFIG_BTRFS_FS_POSIX_ACL=y and without W=1.

My config did not set this
# CONFIG_BTRFS_FS_POSIX_ACL is not set

Do you think the system should auto select the above config as default when
following config gets enabled ?

CONFIG_BTRFS_FS=m
(or)
CONFIG_BTRFS_FS=y

- Naresh

> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
