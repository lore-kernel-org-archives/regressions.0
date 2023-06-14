Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221E7F
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 18:24:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-514ad92d1e3so966a12.1
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686767045; x=1689359045;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0XMSBiDo8EnwlS/NxAuHXvKqJ7PWX8RjNfkfEfB1GdY=;
        b=zSAU5lzePns89P3SFuo1OM+oKQae+GVi7WShgrffrr4QwuWw3wtuxluTYjVRhCvMqS
         mPK/5yvUzJdmaX+Jh9Edli4Zfg9vJ79RWqjxZjRclscN1Jt9RB8/CeHUAYstl2+8xogj
         pB3MQTzDMfog9gnFuqZL+RUHsM2njYC4twBWa+j1xRKy40Um6xdWBrg17NxHeeYUs7op
         ksAVGb3zpxbYOOVZG32rAJSi1dc3jMcEQ0UxH4Am2Y66+NBtMovAC4BW8LZAPei5eluD
         Ff8wAmQ8K1rymK1AI0/+49wKnpR3+lHgxejVictfJUc/XYn2iaa3muQP//5B7nyP7feT
         jvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686767045; x=1689359045;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XMSBiDo8EnwlS/NxAuHXvKqJ7PWX8RjNfkfEfB1GdY=;
        b=L065arAxcWNc7hglOVPpBR0l5X9Zwkyn6AkrjFxMMiH0whXkGBgwrFq4JCCDhBZCui
         QiS3Pt/xhuuhrUsf8n663qSZdaI4+u4y7aTtN5sEIzb8bUbz977bhvKvSDiMc95INcAN
         cIXBzZP2TT59670/JJKIe3LtDuai6zHsz3j+cOQzl56uRMzrfFOWsk0pkxl9rrgRAt3r
         JeajxR7WtLm/ZJPG5m0EjlQg7SlX1gFIEGC/ceItVjoCeqsJ18U/3vmd5GXtTiFuGXoF
         12/3uNGQcu0RQ51CYRAu5IhiHIzCkQM9SnSG0krS5GS4QRCHx46m1MX85vll3c4WWSE7
         UYGA==
X-Gm-Message-State: AC+VfDzm5MXAJ8un4c+u/Qft8BxxdS2O3eskqECo8UHUkPwe0QmCoNFO
	Sy8HO58PRwnCrTWLJCeDHtiHMIl0gA0UKtrWzX2O
X-Google-Smtp-Source: ACHHUZ4FUPbfTsBArfrhGvB4xXY/W/lejL+aLFB3U1S+AVe+dvd/NAucJjEQf4WFTSz3BKgCgoYIR7gwXou+08id5y4=
X-Received: by 2002:a50:a6d3:0:b0:51a:1ffd:10e with SMTP id
 f19-20020a50a6d3000000b0051a1ffd010emr1064edc.3.1686767045189; Wed, 14 Jun
 2023 11:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Robert Kolchmeyer <rkolchmeyer@google.com>
Date: Wed, 14 Jun 2023 11:23:52 -0700
Message-ID: <CAJc0_fwx6MQa+Uozk+PJB0qb3JP5=9_WcCjOb8qa34u=DVbDmQ@mail.gmail.com>
Subject: BPF regression in 5.10.168 and 5.15.93 impacting Cilium
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, kafai@fb.com, 
	ast@kernel.org, sashal@kernel.org, paul@isovalent.com, 
	Meena Shanmugam <meenashanmugam@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I believe 5.10.168 and 5.15.93 introduced a regression that impacts
the Cilium project. Some information on the nature of the regression
is available at https://github.com/cilium/cilium/issues/25500. The
primary symptom seems to be the error `BPF program is too large.`

My colleague has found that reverting the following two commits:

8de8c4a "bpf: Support <8-byte scalar spill and refill"
9ff2beb "bpf: Fix incorrect state pruning for <8B spill/fill"

resolves the regression.

If we revert these in the stable tree, there may be a few changes that
depend on those that also need to be reverted, but I'm not sure yet.

Would it make sense to revert these changes (and any dependent ones)
in the 5.10 and 5.15 trees? If anyone has other ideas, I can help test
possible solutions.

Thanks,
-Robert
