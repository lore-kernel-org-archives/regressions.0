Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230CA943
	for <regressions@lists.linux.dev>; Mon,  3 Apr 2023 21:51:58 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id x8so22187645qvr.9
        for <regressions@lists.linux.dev>; Mon, 03 Apr 2023 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680558717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sjT5o4xvNfeO0u+mk4eqCgrBLdiXC2jtMg+3Cg0Ah+s=;
        b=BY6rpDxeKb8DeVdtM+UrqqtBzn9YBmX6bA4aCVzqc15IKltnlC8nzdzXUX2K0Vrc5s
         rR/AJVkJ/0cZn1OVgnmzyfP4YNtlc58rT+RvyhSRSjBSmb5NfwKoX3UW3LSA8aMNQnQe
         YAV8wc1lGbzCFiM7EV+aIi7nY68VPP8i17rus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680558717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjT5o4xvNfeO0u+mk4eqCgrBLdiXC2jtMg+3Cg0Ah+s=;
        b=xnYjsKdEfI69YmQYGbIggoLTg5uvoDdIlryGoSsItBprknroiuEpj5dHnNM0eE6RyG
         paUdz4I0Ipy3lpmNjBYq9rc96ng8QkNLxzaTkwntb1/3zUijn5Cz/Ul54C+hofCmktgj
         2L6jsjc6UVARTPACSa+ibUynvqgUB+gMYxP+dheFkbNOTujGxw+DmMoOb2mru2uDRn+l
         c/KQtBJTJbZf0lZpTuG8mHIik7yCJEq++dyOHCY0oGh8x5mEr/VvXlW7FPznyTQX0cGZ
         rvnerj24iRcK2g6DprVzZvSUkkF70OCogTYywONqIFTfd+Yw+HiOsLTbU2IXVBxnx3ZL
         ydug==
X-Gm-Message-State: AAQBX9fIlJtQ1euF1PAkOxi/0Tx/EyTM+qnRUN20LgzlBtaHygoYa0fA
	Jy6WeFhLEmgs3Boob2XvxERirg==
X-Google-Smtp-Source: AKy350bTaGQ08kEu83u5p/ijNr8qy5I/X/lIvnEcVkcdouB39xLUA34m5/51K/KXWuL6r29WiCrKHw==
X-Received: by 2002:a05:6214:224a:b0:571:698:eac9 with SMTP id c10-20020a056214224a00b005710698eac9mr39848431qvc.18.1680558717538;
        Mon, 03 Apr 2023 14:51:57 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id a14-20020a0ccdce000000b005dd8b93458bsm2927653qvn.35.2023.04.03.14.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 14:51:57 -0700 (PDT)
Date: Mon, 3 Apr 2023 17:51:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: aros@gmx.com, regressions@lists.linux.dev, bugs@lists.linux.dev, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, linux@leemhuis.info, 
	tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <20230403-favored-subsiding-6e49bd@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230403-b217297-6bf5914fb55d@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230403-b217297-6bf5914fb55d@bugzilla.kernel.org>

On Mon, Apr 03, 2023 at 09:47:49PM +0000, Kernel.org Bugbot wrote:
> Hello:
> 
> This conversation is now tracked by Kernel.org Bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=217297
> 
> There is no need to do anything else, just keep talking.

Thank you for illustrating the "may explode" bits. :)

Unfortunately, triggering on key phrases means it gets triggered when you're
discussing key phrases. I'll make sure that this only happens when the key
phrase is on the line by itself.

-K
