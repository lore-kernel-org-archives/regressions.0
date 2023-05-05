Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0E42F33
	for <regressions@lists.linux.dev>; Fri,  5 May 2023 19:12:05 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-61b58b6e864so19963096d6.3
        for <regressions@lists.linux.dev>; Fri, 05 May 2023 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683313925; x=1685905925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C16o67vTtiW5Sj95zSEy8qfd66g68CibYOi8W/wTXeU=;
        b=GZJWOSjq5YLUs3bzramzfp6vQP7hZAvgWOnsYiqq4w6xvhxRqrFhQRZHUgnEm62bb3
         G4QwIWsyqqJzNO+PVSMeILQKktJbQo7vgunwEodsBQ2NF3Wty2UoYDRfDMBLi8m9M7kj
         E8RgtVxaZPKfE17StgMTqjDxe2IsBWXxquuwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683313925; x=1685905925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C16o67vTtiW5Sj95zSEy8qfd66g68CibYOi8W/wTXeU=;
        b=bWppva2JuwhCF7K2pouC00ZJFstX+/oMlhfwv8ZPZHf7C8wF+KSOui2laaWxGcmCST
         MOF485U4SUrikUZCORL6121GztADn0uGBzh3xNvAktcDh62ab18no8vTTgFGGZ3G5/A3
         y4IwGy8OHLiqOdiZBeFgl5nhOEGPjsPn2XzFWsLp2HOT8x6XZb4QwFl5HGv2je2wrbZ3
         jb7wJkhFOd3DmjLNDDzkDLvViCQhwTUAYoEp6rTIXDSDDNp2yI84OUQuWUd/M425UhFc
         w/8HGaHsCrGH/vzc9sDlDdy42brl0oWAuMrd3NNpX6mTLJo0VkJcuUE4M8ZUmA39FNj+
         miVw==
X-Gm-Message-State: AC+VfDwG2UtWf9MlS64OXijSb6ILcscIJPHO5g6oaedzSFrJu7QVTDl8
	V9XdD4lJ6K6XGw+i1vmGQM1byA==
X-Google-Smtp-Source: ACHHUZ7anJS/esKCfu8bEz7dpeuCicbGJYMxXFivH/mYdV0Vz+p7cTVrxKczFd82GvVWxH/PLUh20Q==
X-Received: by 2002:a05:6214:27c5:b0:61b:5ca6:b7fb with SMTP id ge5-20020a05621427c500b0061b5ca6b7fbmr4228889qvb.28.1683313924771;
        Fri, 05 May 2023 12:12:04 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id g17-20020a0cdf11000000b006210a12650csm42045qvl.145.2023.05.05.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 12:12:04 -0700 (PDT)
Date: Fri, 5 May 2023 15:12:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: workflows@vger.kernel.org, aros@gmx.com, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, tools@linux.kernel.org, linux@leemhuis.info
Subject: Re: Introducing bugbot
Message-ID: <20230505-lent-swoosh-4897e2@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230505085218.60c62d75@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505085218.60c62d75@kernel.org>

On Fri, May 05, 2023 at 08:52:18AM -0700, Jakub Kicinski wrote:
> > Per our discussion last fall, I've been working on a bridge between bugzilla
> > and public-inbox, which went live in the past few days. It's still a very
> > early release, but it can do the following:
> 
> What about closing the bugs once they had been fixed/triaged/proven
> invalid?

For now, bugbot can look at a branch in a git repo and close bugs when it sees
a matching "Closes:" trailer.

-K
