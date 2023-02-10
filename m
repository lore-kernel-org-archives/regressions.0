Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2503D2F45
	for <regressions@lists.linux.dev>; Fri, 10 Feb 2023 13:55:08 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id w3so5720435qts.7
        for <regressions@lists.linux.dev>; Fri, 10 Feb 2023 05:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XIPHxCMD5tFxCkQNamP1KwgZXhCO9JHa2zZcUYu+zE=;
        b=VNcwhXzklTCDhx2S86opLFevpUQrSXsNC7sI++lkeosdSuacvHF4EvNMIPrUVcmLE1
         ypJKr8JzEzAy57MLSz/EZH7+C7uCM+nJmskifqnbM7DCEmskPOnabBlRxkK5gtPJ0OQt
         BEOuhg04dExP0J0eYFixdeZx4sQjcYYvx6Dd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XIPHxCMD5tFxCkQNamP1KwgZXhCO9JHa2zZcUYu+zE=;
        b=1TywOJtwwrrrzukafCoydM3NB1TL9iYWgBb5Itlt4UXjdg0pHVnWS4oFXNKi6cqKxr
         Rz0oTZ2dqS6aqHIOsEZHffV+mb1mFGRxPDBgEyG7M4ibW3k9e9yoyCr3tFc13vHZM419
         BUSmpPfaCMcgHXKbICIRJ1/adenmCpEv14uzFOakLJaZ+nKoxEWJViN3M5QNwvYzZSQz
         wEs445Vn0QCCEILrtzGZSwQKgJjgTbRcQnjDE7CsrRYQMSbFZoRA8OloXqQxOrCG8eUZ
         3t1wJ+qWtu9hj6zuQ+AhCnkgpiZyYMbMrz+Pj6r417vAjIMQG6iCt7G1bVNnH8Q9Vp93
         Whdw==
X-Gm-Message-State: AO0yUKX34SSpn/wjazBsIHl7o87Es4u42mhrvs1cCKeOVJbsgxKwi/lQ
	/I4YmUOo4EA9/fSl9aa7aTwIcAHVjynuXpIx
X-Google-Smtp-Source: AK7set+iuUVYVYSZfmqGNHWnygiBBmIGdActv8aFlM3YnnhwYp9+961GSvD8pgsm7nxBy5K7wkLKkw==
X-Received: by 2002:a05:622a:5cb:b0:3b8:6814:ea20 with SMTP id d11-20020a05622a05cb00b003b86814ea20mr26686495qtb.67.1676037306852;
        Fri, 10 Feb 2023 05:55:06 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id c26-20020ac84e1a000000b003a5c6ad428asm3281450qtw.92.2023.02.10.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 05:55:06 -0800 (PST)
Date: Fri, 10 Feb 2023 08:55:04 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
Message-ID: <20230210135504.jg7tmqhdmhfwdz5t@nitro.local>
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <1f217c94-b90f-359a-2142-0d3ae5d84fc6@leemhuis.info>
 <66fc12cd-65b6-0831-89a8-57636453883b@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66fc12cd-65b6-0831-89a8-57636453883b@leemhuis.info>

On Fri, Feb 10, 2023 at 12:38:07PM +0100, Thorsten Leemhuis wrote:
> Downloading the sources using a full git clone
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> If downloading and storing a lot of data (~4,4 Gigabyte as of early
> 2023) is nothing that bothers you, instead of a shallow clone perform a
> full git clone instead.

As a minor segue, we know we can dramatically reduce the size of the stable
repo (and the stable clone.bundle) if we drop all branches and tags for old
EOL releases and move them to a separate repo (e.g. stable-eol.git).

I have suggested this in the past, but it's not a trivial change:

- it requires a fair amount of git work
- it may disrupt some of the build infra around the world still building EOL
  kernels (for whatever reason)

In my preliminary tests, we easily dropped the size from 4GB to under 3GB.

-K
