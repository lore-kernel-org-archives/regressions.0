Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549823AA
	for <regressions@lists.linux.dev>; Sun,  1 Jan 2023 20:07:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id e21so7986871pfl.1
        for <regressions@lists.linux.dev>; Sun, 01 Jan 2023 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:content-id:mime-version:references:in-reply-to:cc
         :to:subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Xxl7U3B1v3NJ8oz4U1/+05qRwO05QIEsUJJ/AFZS/M=;
        b=L6GI1YFEFRAmMw9jqMVlI6Egep5AfuWi8WMwMUXGqbdaTofmSQ+w1kqzbs2DmGXa6H
         ZW/+9B3RNafnvQOkbB63odteG8JyghrNn3wLlPkeSDFsYkOXw2Jv/bcPLIZaM+SlXDAG
         ugDSYh96aikluExYIvE14HWjczYBtDGf4GNZuPjadOhGgh4hnLGxVhnOPsHvsIayYOmB
         KDZUf8fXWJGYHOd41NXJKbiiOsgFKNdI8cWqj2abp9ScFbbxrFnMfHLzFebDHVdlWUjy
         gXbxjTk3DySUh5yDw9UbI4MYFtcpDs92vG1Zh4dUTjr4+CdfxsWHWDqtc3L7/SZuGHE3
         ikKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:content-id:mime-version:references:in-reply-to:cc
         :to:subject:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xxl7U3B1v3NJ8oz4U1/+05qRwO05QIEsUJJ/AFZS/M=;
        b=uWp5/A3QIbRwd8Zs9pi6c/KsIoG5V/MAhJYhD471iqQBRDfuOTGJKZ5ZDTo9IKuibv
         sTlfcHdr6q6avM3WPiVhtxDFYKRe3tlUK76l9UN3pDkiYVBOwdcfjWuG0QAJxaAj+jUj
         eWLOQHAH5JPvwbFjjUiLGnaw9uDQEQIyFV3hIvPtRTIZC8KGX/6Zy0cfzpc6iLpE9bhq
         DOkCKUGkios6OoXyprKbF/ZqefbOLu8bnnKj4jT1/lKRHud+Qc82Sqhk1veriUmymNn1
         xNKx61CBLPHlbPbeWdoWnQObPKe/S+LDVyiNv2/nQ5LsOn7NoIrkHNqPy0eZeFny0fT8
         Js6A==
X-Gm-Message-State: AFqh2krQBQRkVq9kqTFcYHWVpdf6Fpr7cCDIprH1//XhJtnJjJzJqT5T
	s2Fd+dJm/XGRtoSFkS3e61SneVteXoU=
X-Google-Smtp-Source: AMrXdXt3X+5NylHJvAHXJRwLUECR8D49Z++uadQ7xQHMuOjcVivMVDc3DRKN9u6JzWdBOaPDp5qMWQ==
X-Received: by 2002:a62:1614:0:b0:580:dd4d:43bc with SMTP id 20-20020a621614000000b00580dd4d43bcmr29268291pfw.26.1672603668006;
        Sun, 01 Jan 2023 12:07:48 -0800 (PST)
Received: from jromail.nowhere (h219-110-108-104.catv02.itscom.jp. [219.110.108.104])
        by smtp.gmail.com with ESMTPSA id 199-20020a6216d0000000b00580f224cdf6sm13568481pfw.203.2023.01.01.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 12:07:47 -0800 (PST)
Received: from localhost ([127.0.0.1] helo=jrobl) by jrobl id 1pC4cU-0006l9-5E ; Mon, 02 Jan 2023 05:07:46 +0900
From: "J. R. Okajima" <hooanon05g@gmail.com>
Subject: Re: [GIT PULL] acl updates for v6.2 #forregzbot
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
    linux-fsdevel@vger.kernel.org
In-Reply-To: <2aa5cc7e-ca00-22a7-5e2f-7eb73556181e@leemhuis.info>
References: <20221212111919.98855-1-brauner@kernel.org> <29161.1672154875@jrobl> <2aa5cc7e-ca00-22a7-5e2f-7eb73556181e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25985.1672603666.1@jrobl>
Date: Mon, 02 Jan 2023 05:07:46 +0900
Message-ID: <25986.1672603666@jrobl>

Thorsten Leemhuis:
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:

Hold it!
I'm not sure whether this is a regression or a bugfix. Or even it maybe
a problem on my side. I'm still struggling to find out the reproducible
way.


J. R. Okajima
