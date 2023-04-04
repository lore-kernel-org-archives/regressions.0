Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0A333C9
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 12:36:10 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id x17so9277562qtv.7
        for <regressions@lists.linux.dev>; Tue, 04 Apr 2023 05:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680611769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSpzJzf1FOM6UnLnSTOqyKayxzDBWTCflEqOjyBSbCo=;
        b=aROFRSMiUndfVZ0M+rPTRZvKbg0G3SrN6evNiK/VNwVed0c6Iio2IGw7q5tfNenTi/
         ZYscQ8HaLXqbzKe6CtmHbNUUREysb2gwejhFwHpm/uSgW3TIKjFciYcG9KJwiDzBcBLD
         ECIA0MoDBox8gBNQHDEB3ZwvKdpvw4ys0qypU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680611769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSpzJzf1FOM6UnLnSTOqyKayxzDBWTCflEqOjyBSbCo=;
        b=erYfERtO99Hv/20GEiH3efJr7RfB9x89WCpYL4qCWpeV23A7Jam+cTNcac4krr5VfO
         X2eVhrpBiVJ8rSuqWFIoTI5E5P/Ly15gizty5OTD6i52gDaAbow20sPXI9t4z5bioEhq
         tcYi2N0tE/8dg3q/p2LKU32h9q+ak6a/8Fh40X6dhTrmYGTCbwizpCjc6Bd/kowGByzx
         a1xgtzM9AhXMevbc3iDtKUWt1r6gTio3hjUsotdH9bDoG3slp3j/Ezh1ZDwZLBxiaD5X
         qI1HCCFFUy6ADDaj7KAzLjOk0d0QIooNKTW4ss+BrenjjRkXijhuxkg2LbidUMODhkaA
         PoCQ==
X-Gm-Message-State: AAQBX9fbsl2qUhL7HZMQILERbxBmKYUbizUbyMjruZVFxZ2DPW2VdQoc
	39eLXSsXskEa9LqvYhZldOW78Q==
X-Google-Smtp-Source: AKy350bmIBXc+urbVoIz0HcgJ/oIEa1NP49n3CJPHcmGi2xKjny3EOfz6eI161rjIxZ0tXl+zYAJGA==
X-Received: by 2002:a05:622a:148a:b0:3d8:6b0d:f9a4 with SMTP id t10-20020a05622a148a00b003d86b0df9a4mr3121325qtx.44.1680611769053;
        Tue, 04 Apr 2023 05:36:09 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id q19-20020ac87353000000b003e387a2fbdfsm3226631qtp.0.2023.04.04.05.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:36:08 -0700 (PDT)
Date: Tue, 4 Apr 2023 08:36:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: workflows@vger.kernel.org, aros@gmx.com, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <20230404-bacteria-refinery-a97393@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>

On Tue, Apr 04, 2023 at 07:58:40AM +0200, Thorsten Leemhuis wrote:
> Would be great if bugbot could CC the regressions list for all bugs that
> have the regressions flag set to "yes"

I'll see if I can add this logic and make it configurable.

> How does one make bugbot forward a bug to everyone in the signed-off-by
> chain of a commit that caused a regression, which might or might not
> have a bugzilla account?  When the reporter performed a bisection these
> are the primary contacts that need to be reached out to, but the
> maintainers and lists for the subsystem obviously should be CCed.

I can add a cf_bisected_commit field that can take a commit-id. When gathering
recipients, we can check if we know that commit in one of the tracked
repositories, and get the author field out of it. Would that be sufficient, or
do we need to run get_maintainer on it for a full picture?

Note, that you can also add addresses to Cc: on the thread -- they will be
collected behind the scenes as each message is processed and any bugbot
notifications originating from the bugzilla side will also include them.

-K
