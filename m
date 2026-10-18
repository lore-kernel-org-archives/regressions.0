Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253963D3492
	for <regressions@lists.linux.dev>; Sun, 18 Oct 2026 03:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294963; cv=none; b=Wt+gr8CW5kOrRl3YfuEmRMgnVqr3iY0+PwuQN8LKTyIYVD3vdaLiU68scn55LaM+ycRy7lh7qWRGVkohy3CmRR6eQaTczdKYuuvARsW0oDCjRMtp2YOgv4oGv2QWgercEfwQSInH9uMCj49uWtQyH7zlQQC38M3A7MbS6geuWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294963; c=relaxed/simple;
	bh=OEiXZACQSG+UMfc3g985+eXqc1K6tNvfEVBEPiC+0Js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=o/Zoz9FOhjI2pfdbzHjxGm1bOwb7lt7Ak3g626pFwYAlPcCDZsqU3JCbklrPuWPVobwlrMSt1x/Vh8hqvd+YyU72+aim7xu95Gn3RhYkHFFOFXZ11iXo4X7i0CRBIo+HCFGOhnNdhbNqyTm1C3nKFZgkKsQ/u0kGqEbPXnmO8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gymZneaJ; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gymZneaJ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo1923791eec.1
        for <regressions@lists.linux.dev>; Sat, 17 Oct 2026 20:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792294960; x=1792899760; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEiXZACQSG+UMfc3g985+eXqc1K6tNvfEVBEPiC+0Js=;
        b=gymZneaJEZeMPb6NfSaliYuB6FmpV2GsQ7/PF3hIuJmyU5NaHOHa4Qn88P1Q1MANs5
         lVShmQzBOILLBi9b2WhrN/k5oQntVhwRaEqPwFx5JdWcJFIlZfA6dNWLJRb3TYjRj5Mw
         kHaoYCmzYc7xZShYPeZMbsCafG6GIaiUMw60GE7vEkLsj42yN5uSfAAVlYXJuZo0IF47
         FyzPLIS+B1ew1vxllgEDNcUnYqGr/N41+7RbGJyilIitcg+zQEtOMbmawZdCx4ODP57c
         WCA2p9GmEvZk5t3in8FVtQnmER+cmq+TtrLcKFXkVM9amAtSmuQRFFzmj06o5cIziY2Q
         qbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792294960; x=1792899760;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEiXZACQSG+UMfc3g985+eXqc1K6tNvfEVBEPiC+0Js=;
        b=QPYnyn523jEpqOsQlDXx14iGFpYhgYMcdGv5sIuKU+VAYNFl+yWiMhLwM7tMMt168S
         BPDGKWGBpsbEXrfYvw9Nyq3Rk/6DLI2KuWPf5B0FNPquRxrP2gPQrypU42YGd6R1p8m3
         2IorhRTRky8QsaQVOmOwFq8IvSbOHSZrjIzY4kW6/HySEqwaQrLL9IdfsBq0FWSv0T9w
         fkJYp4PHTbOzJC7F9q784NdLBdCVza3FnlsG2bpkfU/mWKcH/wGP0ACJSCNDQhSr24yp
         GePc+9FXJ6ObQd2omU8KByRnEKzcOTSrH3mDlRBcnWkKO6a9wQafUjdCmJcHGS1ubM1+
         zotg==
X-Forwarded-Encrypted: i=1; AKwUvBztVOwpLcDcNQMBRLOpUjGlL93cVQdpUlyXTH17vWWeIVHEmN5dd8grR/b3oI/lEulQzFRAcGSWgMq14g==@lists.linux.dev
X-Gm-Message-State: AFq9FYK2BIE4EusrWOP9ybJfiS7TUMvkDxQrPvatEiUWMRHs19IWG5sc
	aTaNrDyJV/x9oTWlo8RwVqSeKFi9Q2By7qiXZyEz2o2YvZPRYrhZrlVO
X-Gm-Gg: AYBFou0zY+tSNb90C0NI+CUDB/Wxdvbgcwx1DQj/HxqN9ee9iJiem+wRsvQjbdPfwOR
	dIqi54SLAAV0vwjgb1+csgZFUHKPoyGMWdMLFZHR7f9Ug6uInvXR860jTdNWndjWd9xs+774aIN
	hIeyTbRaaC/XWsvvFb9wSUTlSsy9wezq2+7VfPzCdwueXOBEm0R19zY1OS0u6Wv108yv+4mRylY
	yLMA6WwVhhB2xN1f1QQtn1zX6Z6r1M1+ZLZFcmBJB32LXkzRTQnpgISjANItGzmhiEBLbRmwN3y
	qYgUVAeeL/1BPcFZOULbBLffheITmlkuAzUFJR2j3Xm66F3ke18pOU1wiEXPHK6yw4VLIui0yQW
	TV0yGa55VMLEBgc0vODldVnFnZedJsL/hMdDeovSv4ILp1h7eB6wYHNXqm/HFuwrt5BqKtp7OpN
	/5uP2DSeSCzrs6b7jST7TYQ+O+WrB+e3xrSzRe93I+GNl2zrLYWETMsWHx0z2vrLmMsg==
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr6502042c88.29.1792294959920;
        Sat, 17 Oct 2026 20:42:39 -0700 (PDT)
Received: from localhost ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm21454007c88.12.2026.10.17.20.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:42:39 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>, Martin King <martin3kx@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Subject: Re: [PATCH] sched/rt: queue a push when a queued RT task is boosted
In-Reply-To: <atOGI0tcyXnuWuD9@scheduler.schedules>
References:
 <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com>
 <20260814183652.611e7ecf@gandalf.local.home>
 <6db9c47f-a1f8-49dd-9e80-f9014d75f9e8@leemhuis.info>
 <20260903092037.5b739980@gandalf.local.home>
 <20261015061915.126442-1-chaosheng.qu.linux@gmail.com>
 <20261017121423.393837-1-chaosheng.qu.linux@gmail.com>
 <atOGI0tcyXnuWuD9@scheduler.schedules>
Date: Sun, 18 Oct 2026 11:42:32 +0800
Message-ID: <179229495240.39966.14792426764563252817@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks. The long explanation is below the --- in the patch; the prose above
it is the short changelog. I added the Suggested-by and shortened the
changelog. The commit is now 04de902d6a4e8a6ce6471b97d73f869c5753dc61 on top
of 1d08a07fd492.

The patch is attached.

Thanks,
Chaosheng
