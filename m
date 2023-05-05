Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72824C12D
	for <regressions@lists.linux.dev>; Fri,  5 May 2023 19:39:41 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-61aecee26feso10442606d6.2
        for <regressions@lists.linux.dev>; Fri, 05 May 2023 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683315580; x=1685907580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6BqLpqsqpfv4e6MRMY7gBjrDbHLmMrEtwfllMgszTw=;
        b=OjZbBTcfGOQAnlSXtPwCAuc+ky8ALtIYzA9WpYBwiKNrPvoibiC3t0jK3gh8lkyHCV
         I7PqXmoVMTlkgVny0PKfZnI2bMDwQve5OkO2TDvJ/heMmyYd158XR5k5E4Yg8FlLyZIE
         jbsWZALi/50JOayWZBQHA0Mvr9ctCyv2fch9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683315580; x=1685907580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6BqLpqsqpfv4e6MRMY7gBjrDbHLmMrEtwfllMgszTw=;
        b=Iaav8hTnU2a9WSbOHeto+I5/eSZFSGXX7lRxnUqy/v8ynr8F7ZXb4HkOuveLwvIj3d
         bCZuzOPN8nu9s/ErqYXdhN3dynwI2p3oeL4fktTsZV9NihYaFwKoGIkbyzhxhZevDNL4
         3RS0+zHrpMYNpEmUp/zMZKmHqKaFJS3++2QeCo5VLSTWltIMwCn3SMQ1JMz/nhWx5KGc
         +FohtMUPoWxoPFBf6egP8Pe4pNvrv7D5S50WF5KqjU1BT4cm2NDciaiTwcA9fcH9yIak
         9tRqTLBmRN9OLASnT8sELHgGfCVbBIE1DvVBLQJy64jPVgDa3HhoUQ/2cHfgl8fhqtTI
         y9UA==
X-Gm-Message-State: AC+VfDyvmzhp6EvwqxbQCiuYNg0I3ddLEkbhR6vHkSBNEtITVotZx7Eh
	oSzCATrQmTjXvrbQR9id/KTg0w==
X-Google-Smtp-Source: ACHHUZ4sL0e5LUqXusK8zAVq+1JZOQ9Ih7SpSisWHVue2HXLyx7MjYodDozdQjwiEDJ0GtrOJMx5gw==
X-Received: by 2002:a05:6214:5299:b0:61b:6fcd:34ab with SMTP id kj25-20020a056214529900b0061b6fcd34abmr3982129qvb.0.1683315580300;
        Fri, 05 May 2023 12:39:40 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id o16-20020a056214109000b0061b5ad0290asm808144qvr.67.2023.05.05.12.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 12:39:39 -0700 (PDT)
Date: Fri, 5 May 2023 15:39:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: workflows@vger.kernel.org, aros@gmx.com, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, tools@linux.kernel.org, linux@leemhuis.info
Subject: Re: Introducing bugbot
Message-ID: <20230505-blunt-corncob-6e6e95@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230505085218.60c62d75@kernel.org>
 <20230505-lent-swoosh-4897e2@meerkat>
 <20230505123226.731d8ff8@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505123226.731d8ff8@kernel.org>

On Fri, May 05, 2023 at 12:32:26PM -0700, Jakub Kicinski wrote:
> Interesting. Obviously that assumes the bug needs a fix, and we're
> talking bugzilla so lots of clueless people lobbing non-issues at us.

This is why anyone can create a bug on bugzilla, but only a subset of people
can enable bugbot on it (by setting the bugbot+ flag).

> But also - Closes: is a legit trailer now? I thought we only allow Link:

It's a semi-legit trailer and is going through -next:
https://docs.kernel.org/next/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> In any case - I'm guessing I just don't have permissions to close the
> issues via web. Is your preference to iterate on the bot or maintainers
> to request permissions in BZ (how?)?

Yes, it's not a power granted by default, but people just need to ask.
You should have this awesome power now.

-K
