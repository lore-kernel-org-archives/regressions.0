Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A12749E2
	for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757507311; cv=none; b=QFZc9sGoey7KT7GtK3hfUTD3gddLGkJAe/JqR0vg4/oZrWHhzhol4zUUjfmPDJkKjfOXC7S9jk/CdtPyaMRnAEh/6X/c6qXj6z24M2F7ZovAsrMCGnhCWxUF/qD+2M6dTMoQ7vPKJK40n6zsyUJ9Uqg6PwDgdtPX5rFc5PhnZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757507311; c=relaxed/simple;
	bh=xr+pHWDpFhG101gZJW36qscUm47fFzwtzUnoWeWDmLY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ib1wKAEvdnPc3EVXOFmF3pwPUfu6sR1vyAdh6fl7PNxVQGoZ8qz6SE34tK98vkQ1/t8ZuRfzhPxNNebepeE6HG9fDMyQCLQXqRZRU5NI83y5pwXe70AciXLLAphUMZCxyOQK0gXJaw+PPcwY8wCx7e11S6MFgy1yhhhmh2WGbvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c780gDmB; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c780gDmB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77287fb79d3so5330096b3a.1
        for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757507309; x=1758112109; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uKKz38rJoChd6hasvypIOinRdsvj7L3C/cH5A2UhAis=;
        b=c780gDmBF1n7DRUWItnWjqi22D9M9bGnZ4BYnZYK5DEwX13DGK+BnuX3+++rZo8Up5
         3mqgP7rlQZb+jCEmaJ4l5JL2Vbfi++BB4dfjw1nmxbRSLyFbUfiK1y6e/6CkG7yzvA/3
         HVgSFb4A3gQlO8LRFnAs/ESNAifon11IYfXp9wI2hFl607hHiC29v3wuqAnQ+Po+WC85
         wv3garWhZzBw00Ohc/XLh/FnQiJb+EuHB58u6gqa3ts5hiaAIth3t29J/3Rc6aD3z5MY
         ZWC3z/QsrzpyHa4/5VIRBpSd5Dz7KI2Sh+CsTZ1+G2JRF+NU46YbIvzYzwjEhHcQOawG
         +WIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507309; x=1758112109;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKKz38rJoChd6hasvypIOinRdsvj7L3C/cH5A2UhAis=;
        b=VUp/W0O6WPgC3BYeGQf/oJNvVWP1JiLrx/VFPed90h466nrW6hDjz+aS7Da4B6IlN5
         XM0aSqSwFK/TtIS0u+VbnIYLlWGbqqNkkmMpSmsbQsXSSrLUxTcLEeqx07kr6hn1rlo2
         lSOHtkEabfwvacXu59XUXwxrieBKfSZt6GoKIb/3cvm5U4L6NO2qMvnrDWBK7sL2AA8S
         VDL6f+qKtAKjJ4pj2SuOFH5ge9erhcTT/4l7ZmHhDnGwlpTjHAcOMubNWmHkgoFwSoqa
         seNOt3MjogtKYXldFZ81xHtLOITEzxX7rZYeXxRMscGsAbx/nsKPh+D0mRgbLzZHPArc
         rWyg==
X-Forwarded-Encrypted: i=1; AJvYcCWhveXuQctiWmWQMczwyu8S3RuKuNfNDuusbC3XsiD/+DtdLOO4hoiGe8wxxkCNYmVzOh3XjzwoicRLlg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/HHqQw4Giiqrxp/2y52L+muDRNjP6h4jCECQE0OUVrbxdQoo0
	M484sRCcuyQBJSqKacwNKzBF9fShcA3KYVOkY83OLo5xhA13HdKZGAxQ2ROHWUpEyr3DHDIpcVT
	zSHFLIHrBDmGxgn2XvRB6qD0QB9yNBnf1py8zbjIJcQ==
X-Gm-Gg: ASbGncsLpHKBf6Kk48MIsJ0RFWISx/yxam3uV6gY4YQd8F1myUTqfP/285I8OVboELB
	Tzo7PgevQ5ZUOEThDvV5YawLBUPOb9+pm/0NoARmgzpUStQF4ApRSMeWT6nMUaWDl+rmbzvpc3W
	MeRLCKLv5x+U9LeCeViw9SzW9qnuQ5BikbF73+eFNENdk2fThartrmgcunkG1J84uePOyTaXs4U
	DXQrJ6GLIKs6zz6v5ejSsCFKUrWk5MvZH8oQE+764zcT2H6AzFtfPzL90vO129m5nHLTzxqM55j
	wPZmWY3P25fAPngFkw==
X-Google-Smtp-Source: AGHT+IG4qzDgYzLw61c20CouFv01sBXpB434aIve9D/nBM4iCZ8x3Y3u0nVvalLiKmVp0DIuV/6ujgGhDDoSGv7mFtM=
X-Received: by 2002:a05:6a20:734a:b0:243:b38b:eba3 with SMTP id
 adf61e73a8af0-2533d225e5amr22112020637.20.1757507308800; Wed, 10 Sep 2025
 05:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 10 Sep 2025 17:58:17 +0530
X-Gm-Features: AS18NWC_Ip5gUfztIBhg-V1fX8vYtT8uTSYaRWdst2tMKb6IDGdmP3wp0PVgMdM
Message-ID: <CA+G9fYuW3VZHpAzoL5pRXu6_K9LMHynNzMO9ULrdsC4UKY-ELA@mail.gmail.com>
Subject: next-20250910: ERROR: modpost: "typec_switch_set" [drivers/extcon/extcon-ptn5150.ko]
 undefined!
To: open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors are noticed with arm64 defconfig+
with gcc-12 and gcc-13 toolchains on the Linux next-20250910 tag.

Regression Analysis:
- New regression? Yes
- Reproducibility? yes

Build regression: next-20250910: arm64: "typec_switch_set"
[drivers/extcon/extcon-ptn5150.ko] undefined!
Build regression: next-20250910: arm64: "fwnode_typec_switch_get"
[drivers/extcon/extcon-ptn5150.ko] undefined!

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

The suspected patch, (The git bisection is in progress)
  0d6a9aca15c987b4774f7fdb34114ab0d483766a
  extcon: ptn5150: Add Type-C orientation switch support

## Build log
ERROR: modpost: "typec_switch_set" [drivers/extcon/extcon-ptn5150.ko] undefined!
ERROR: modpost: "fwnode_typec_switch_get"
[drivers/extcon/extcon-ptn5150.ko] undefined!

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250910
* Git commit: 5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
* Architectures: arm64
* Toolchains: gcc-12 and gcc-13
* Kconfigs: defconfig+lkftconfigs

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29839409/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250910/build/gcc-12-lkftconfig-graviton4/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32V3KFrDCJV0h7Mw72c5hdncTEL
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32V3KFrDCJV0h7Mw72c5hdncTEL/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32V3KFrDCJV0h7Mw72c5hdncTEL/config

--
Linaro LKFT
