Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947C51FCF
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 20:43:33 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b72329b63eso5420457a34.0
        for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689108212; x=1691700212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjUdrFfcJIMkJGNGdxZJPX7vh7QvoOKA+YjjfGd0IZ8=;
        b=RYbbIOpTwNHNj8ZeTMcyXdIsmQTac3bFnM9TN91zjqc/1iXqGe1kB1+IvF4rAcPI6v
         13uL1hBfR//0LG2EWnwZ7va1bOLhwKOAXq5ttO9UXkkUe/IhLXTy7Oo/kRMkwGGs4XxX
         rH1tJJjvgom5VzijBkd4Gp9D7p9hr7DhdZbMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689108212; x=1691700212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjUdrFfcJIMkJGNGdxZJPX7vh7QvoOKA+YjjfGd0IZ8=;
        b=SROWww3QQGIv1BZ8EYkiTBqZyoz4vtnWmo5+s8kWF3OeoaYpbl5I/OriUWHcaIlcNp
         dZK0TksNLaSgc/aaQIMBo8c5JRNmZ+OuuisxE+GcWrjVkdO7Wr3KbsTUJUi8zacmGj37
         qdpic+CeFDwKh2ZDY5NTR7FMQxrXvgfWoR0H25gsMAgvnt+Ce1Lg8eiif3qx0+KCjBv0
         oLomBiUQ0c4hy96FUsEn3BxodRjCS+Z69Rig+uVyP+u2v1MhxbsXgR9mN9AfPHMHWTdj
         38Hk2VPg5C9c+v/HtOW2Rj40cBlYyAKkxLUH0vi2/H3PCw10KRUqN8T1c3nVEkrO3zNK
         iqLA==
X-Gm-Message-State: ABy/qLZJHO3Fw0W2ESHLpYXfs7MpKzP1L3nUbGMDgBqPyPjEmNsVc8sj
	LzjttXexbG+92v3NRRN/ZSHHkw==
X-Google-Smtp-Source: APBJJlFmr4987jlLXbzbogCv42AY5QKpJU0kjVY3vk1WjHNHiRZcqdtpvaIXNxQHbdNJhuwDqo+2pA==
X-Received: by 2002:a9d:6497:0:b0:6b7:5430:706c with SMTP id g23-20020a9d6497000000b006b75430706cmr2357614otl.24.1689108212495;
        Tue, 11 Jul 2023 13:43:32 -0700 (PDT)
Received: from meerkat.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id 83-20020a251656000000b00be8e8772025sm627518ybw.45.2023.07.11.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:43:32 -0700 (PDT)
Date: Tue, 11 Jul 2023 16:43:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Bugbot for all kernel bugs?
Message-ID: <20230711-encore-hunchback-2d103b@meerkat>
References: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>

On Mon, Jul 10, 2023 at 07:28:26PM +0200, Thorsten Leemhuis wrote:
> Hi Konstantin. Is there any hope that bugbot will be usable for all
> kernel bugs in bugzilla.kernel.org soon? It sounded some weeks ago like
> that wasn't too far away, that's why I wonder if we might have arrived
> at a point where this support could be enabled.

I just need to add a wrapper that would make it more convenient to run as an
actual service as opposed to in a screen session I've been using for testing
purposes. Probably a day worth of effort, plus documentation.

> Sorry for bothering you about this, but I'm getting a bit tired by all
> that tedious man-in-the-middle between reporters and developers to let
> one group know about things the other did...

So, we can't easily do "enable for all the bugs" because the bot was written
with the idea that it would be invoked per-component. Is there a bugzilla
component (and a matching mailing list) that you have in mind for the bot?

-K
