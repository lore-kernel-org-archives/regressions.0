Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C20AFC1
	for <regressions@lists.linux.dev>; Tue, 28 Mar 2023 23:08:46 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54184571389so260624387b3.4
        for <regressions@lists.linux.dev>; Tue, 28 Mar 2023 16:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1680044925;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSQMHyUAqVGVS2BQigz/A6ja8dJSfiSf613vf2Qfabc=;
        b=cVQt9bu7I3EGZHXeNHx3U4o57jcXzPIJjBZMjpKHD/FUnKowQFmQs2AQ4+hk0TZMLe
         9ooVdivzmNZBQPN6C6EW8Zzx/Jh7uVO7Gb+BuedaxYeBCliIHiFPN4eAL10XC92aj7vH
         +e9wUppKga8bQydQE3lwD6FMYb/oQoPDMBPXAOypC+IHg8WnBgQiShkQTltg/fpzFEy2
         BGTYNjh9fqOjAGqkDlBQ8UBUiyYGELN85aHNIBkI/vOhS8mmlYPf6ympIB+hRvNaHq8T
         QbWO1ipKw76wtjrPGos+97NgT9jJ7EW3fweMyFv3HyIGs0YvJncejNxkp0FgeymH/0Ze
         AaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680044925;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSQMHyUAqVGVS2BQigz/A6ja8dJSfiSf613vf2Qfabc=;
        b=Im4CY+0aMFScAg0tabmsz2I4XXozhzLFj9U/8mrq7W1EE9Quust8kdpo4OMeqw7ac8
         /W1VeAhxB5wGbMlXXoENoq8U4h2emr0Y9U0zrJl58rP495LUb1TGpuo0BLrj5C4r3UkD
         fFv8ysLojeQ68N08NyUOd0leNU2Oyur+MPuRg6w/94CISypOeHyiupp9CI1k5n8J774N
         F+hby5Ks20lJk+nklG7DUZBVYJ2DsyNym/la193le6Gr21+yY8iaT4Kw1iWk89GI/tRB
         YwVdmS/+ANwuKAgYbNKRf+3vvIoBm/ay95r7IjxeJvg/pQmvIMHLajBCHN6wtLtiJqtG
         wsWA==
X-Gm-Message-State: AAQBX9dGf4d8VgkbFrFeRtLOpjl5fwqphqvwWFNEuUtFdmOmKG31KyXY
	GG+LQldMbuNeHFhkN7ErC6K0Awu93jfcP94DNai3
X-Google-Smtp-Source: AKy350abK8FdRjqum0rkpK7dFO74Ka6qWR1lzCgORAvXYVmNk4vPUiF0YnEYgjzDVu8XJA0CXmwa6+vQTcGj4938tKo=
X-Received: by 2002:a81:af18:0:b0:541:7f7b:a2ff with SMTP id
 n24-20020a81af18000000b005417f7ba2ffmr8217177ywh.8.1680044925502; Tue, 28 Mar
 2023 16:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Mar 2023 19:08:34 -0400
Message-ID: <CAHC9VhQ7A4+msL38WpbOMYjAqLp0EtOjeLh4Dc6SQtD6OUvCQg@mail.gmail.com>
Subject: Potential regression/bug in net/mlx5 driver
To: Shay Drory <shayd@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

Starting with the v6.3-rcX kernel releases I noticed that my
InfiniBand devices were no longer present under /sys/class/infiniband,
causing some of my automated testing to fail.  It took me a while to
find the time to bisect the issue, but I eventually identified the
problematic commit:

  commit fe998a3c77b9f989a30a2a01fb00d3729a6d53a4
  Author: Shay Drory <shayd@nvidia.com>
  Date:   Wed Jun 29 11:38:21 2022 +0300

   net/mlx5: Enable management PF initialization

   Enable initialization of DPU Management PF, which is a new loopback PF
   designed for communication with BMC.
   For now Management PF doesn't support nor require most upper layer
   protocols so avoid them.

   Signed-off-by: Shay Drory <shayd@nvidia.com>
   Reviewed-by: Eran Ben Elisha <eranbe@nvidia.com>
   Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
   Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>

I'm not a mlx5 driver expert so I can't really offer much in the way
of a fix, but as a quick test I did remove the
'mlx5_core_is_management_pf(...)' calls in mlx5/core/dev.c and
everything seemed to work okay on my test system (or rather the tests
ran without problem).

If you need any additional information, or would like me to test a
patch, please let me know.

-- 
paul-moore.com
