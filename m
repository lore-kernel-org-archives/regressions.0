Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2D76D28
	for <regressions@lists.linux.dev>; Tue,  6 Apr 2021 13:51:54 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id u3so4989725qvj.8
        for <regressions@lists.linux.dev>; Tue, 06 Apr 2021 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=SAH9zmKUk3csGOJcaxSXyP54gFvmy2kUmaab3Vw4S6E=;
        b=bKm7t+qWtamIULhRCn2jxLzyg7Su+rm61PbKhnKaEu3ybOvqv66LIgTgTha49nqW6o
         bY8cM1jyzwBxjpoT92gQVX5zNu7gH0GGFJfbbbVxWrk53bOvP8MuXIr5tPeXnaAa5gDq
         HFWRPfvrobS1WwJk5pfnvH4nIEa3WkUKdwDR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=SAH9zmKUk3csGOJcaxSXyP54gFvmy2kUmaab3Vw4S6E=;
        b=ZA6GmcV2uxcGCUtYdFVaUDf9/7Ho6n9eEAW+KqJ3nWXTMvDmVYDFZmIt3wf5QkBdCy
         q+iYvu6CK8aRvQA4C25kUnyU0DajxNI7LntXmlJ9S76lu04cui3mPdkX5EfA0XZin32h
         MbokgzZoY+s/hIT1daNH62wXQjeXR/hOoTS7/W+Ng+celRFk/78gMG22XuJyaS2f2/5R
         Jcz3YvvTUbozP0osOy1iDHher2+vX7r5DdqQOXEM1MdtCkCvW73L73FV+MadoNrD/Myg
         ideH6FeWK5/8S+QJHz5e/n0RIGB/QvCZhAd6EHDGnOVI20j6rfT2UKbU39kQyCQ9T5DA
         PUhw==
X-Gm-Message-State: AOAM532RhWRtRbe31Tf2Q22Su5xPA5isp8yAg1VWE/28sDuP2j+mDx5A
	TH5COZAkTDxb3b7/+MM+fiOKHSEHX5jGuRSdFBY=
X-Google-Smtp-Source: ABdhPJzj2yInG47m/LeQXbK5Pwe7tUnz5GxI1FgaPH+IDlruSAKDdqeBJ5hAS+8OO17TdAuAwSLOZw==
X-Received: by 2002:a0c:aa55:: with SMTP id e21mr9165020qvb.28.1617717112990;
        Tue, 06 Apr 2021 06:51:52 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id j18sm15538285qtl.83.2021.04.06.06.51.52
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:51:52 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:51:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: regressions@lists.linux.dev
Subject: Initial message to start the archive
Message-ID: <20210406135151.xt6uzpqtaqru6pmh@nitro.local>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Initial message to start the archive, ignore.

-K
