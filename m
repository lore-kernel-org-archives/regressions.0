Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CABF7C
	for <regressions@lists.linux.dev>; Fri, 10 Jun 2022 04:22:03 +0000 (UTC)
Received: by mail-oi1-f202.google.com with SMTP id t10-20020aca5f0a000000b0032edae98904so3377239oib.22
        for <regressions@lists.linux.dev>; Thu, 09 Jun 2022 21:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=p3GoMTVXPNUomTRg5kWwEPmqFJRlSBdzBrIInDB9lY8=;
        b=E6PdI/Zs1u2vrzLtttmte7bBW6aXVChZR41TQD2BKzIykbvrdKkxvuKfkHuWfBW2ot
         udv4y/rSdZEVPr2gNufCjXUr7/ov0Y49W1bC42813n7U0wItHmJXaabXq4d8zIepKtcV
         z+OuhUDUT7LaCfjFeYpwAMUfHzzOKtS9Gx0/0/xXgVtiiL26z1l/ERg6YVyxPbM9KGtf
         3z8jhRXAs5iTLZFqurOV5LH00zpIL7hh5lhnbS2eZbDKWHLBxR3sn4GRgQoLmJsTuqjI
         Ya5ghEAtzJ7FVs4fKGlNdVPsW6N3v6ejYuLcDTz79KUxaafTyXQjW34w2q6Wi1g23lXW
         He4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=p3GoMTVXPNUomTRg5kWwEPmqFJRlSBdzBrIInDB9lY8=;
        b=xIcjPMVXt2wGEZX6T5ny3UBKkyYDR6q/f8PlcdQ4iwNjYi6pQ7orggMSa7FW6j4zAQ
         GytoiWFND33sCuGt+pKRhqXKHMH5/48sOgQPHJkJ8ujZxBOgCiHmRZUaGhkz+evX6dQW
         VLZqq0oZJ0KHmtbl98kOCU+x8olrJTicr2vP43pOgQ2X809fmpUlppD8pRMyDfGeh99q
         lqwFu5+ZnAnPTH5A2hUY4Okv0gY5kC+GM9KuWWwa4BvALTKWw1t2aLge8iid+Pw7lLEk
         cclT3oyAqU5sKM0c4WApuIKm0pBLeeZxKudnscxwd1lkX0rx+cTBq0rRkber6QYiZqZZ
         xYoQ==
X-Gm-Message-State: AOAM532fDpuAS0Y/z6lVjZH5wmoFo90z6Ynnq49nbeyAeiRcnVx8GD7q
	XmGqZQ1Qm4xxQ9RdMvoDKZJShZA=
X-Google-Smtp-Source: ABdhPJzsNakIyUullb4mIHvyY/6pTAev8lz3aoDRj1UP3wcdy6KiJI5DZ37K4Kf1dHz2B+oQcwnx4Ew=
X-Received: from hmarynka.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:925])
 (user=ovt job=sendgmr) by 2002:a05:6808:202a:b0:32e:f6b5:bbe1 with SMTP id
 q42-20020a056808202a00b0032ef6b5bbe1mr2403676oiw.266.1654834922205; Thu, 09
 Jun 2022 21:22:02 -0700 (PDT)
Date: Fri, 10 Jun 2022 04:22:00 +0000
In-Reply-To: <20220603173816.944766454@linuxfoundation.org>
Message-Id: <20220610042200.2561917-1-ovt@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220603173816.944766454@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: Re: [PATCH 5.4 26/34] dm verity: set DM_TARGET_IMMUTABLE feature flag
From: Oleksandr Tymoshenko <ovt@google.com>
To: gregkh@linuxfoundation.org
Cc: keescook@chromium.org, sarthakkukreti@google.com, snitzer@kernel.org, 
	stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I believe this commit introduced a regression in dm verity on systems
where data device is an NVME one. Loading table fails with the
following diagnostics:

device-mapper: table: table load rejected: including non-request-stackable devices

The same kernel works with the same data drive on the SCSI interface.
NVME-backed dm verity works with just this commit reverted.

I believe the presence of the immutable partition is used as an indicator
of special case NVME configuration and if the data device's name starts
with "nvme" the code tries to switch the target type to
DM_TYPE_NVME_BIO_BASED (drivers/md/dm-table.c lines 1003-1010).

The special NVME optimization case was removed in
5.10 by commit 9c37de297f6590937f95a28bec1b7ac68a38618f, so only 5.4 is
affected.
