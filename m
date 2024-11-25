Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0571AC448
	for <regressions@lists.linux.dev>; Mon, 25 Nov 2024 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732549502; cv=none; b=XF6ErTuyWdX0bBISePHv8grK/syVqDhJOJNhsgWG9hHMwVnLiNvjcAX1OAuIwmeOoFn2eIorZprl9KUV0RvgHABJjlGvVmfp2yJOsGLu8zoDgBA/KD4GuKKGXNIQSkyw+ta1ekuf68F6YZHDgrohtBbUzo+nbqKTaL2R1se0jag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732549502; c=relaxed/simple;
	bh=dW01jml7QuWrxNse+HQfxhBK/wVmoY2rFUAU8U6VDcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iiAh3xchsWDr1desKY0VT6ckB/SF8oZqX3OjyoHwXeUEIAzEWT/3VyISJku9Kt1RNujwNtoTTzE0+FsEG1Nnr/wzHTRESGSCgR9YauCn7m0GMy/J89XHdDAt92us+WkQnnFlBraN6q/+l1MyEWIyU5yMn1Yi5Cv0K6J/v+v0jkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHvjJEiq; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHvjJEiq"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e383bbcef9dso4398059276.3
        for <regressions@lists.linux.dev>; Mon, 25 Nov 2024 07:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732549499; x=1733154299; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oqwKGtah5W5RVxkR4Dn4jwhHuGxuiGBlO24hxYbYMms=;
        b=KHvjJEiqcD2AUrwWbFWB0rbkc0lQPqfbkBefvcx1MYcFDQ9EyA2pbboNsptc323w4B
         SXehssRWRfogDNowxm57Eeuf0QZYJftZHFrIbFvLY3sO3z8aw29ZA+vmbobLeW8tOgEk
         G5Ovb7nP1rVnlgZrtuJWZ4ycAex5zNoh6LHNVWmdzqEpGoTuGwmcqSvzdZAbRXm25iHQ
         UA+M3YJTYSzZI6ThSmyosb9VHhqz+TL7cv6vKGdDdF8COGDcaG8UCxr6Q0gY4zVPMwcT
         H4GVpP1mYMZlzW+jsXkiLNC4PAYp5bciuOOfWHi/5TI3uPOMmVHFxr9aJobKfyhyXNpl
         XuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732549499; x=1733154299;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqwKGtah5W5RVxkR4Dn4jwhHuGxuiGBlO24hxYbYMms=;
        b=bJ/8KkrCUJSoojgRW/zqOESaCZWziBDQdnwLqdp7wmooVGyMrERFJHJuBXQ0qBGnBB
         ckA8yrR9JRbMIwxOb5L2QXPnSvRSsIrvDPXQqcJEIP2EM9r18p8Eo8fbek3D2G84H/d1
         41sChanFvzg7h5LWQ2eMQCYObrSfySJ0e8kVTWRywbrl+Ooxq+YL7b41q6aTSMhurupU
         nBiCvtb4MsSpLN4Tt/yv52UAlQGUTI+Aedlj66UhsxKy+QqMTI4boGPB6+7reJ+ZcPy9
         BG0xoxQyUtmddEBbGKG2jon8wiRoi+/Jv88CknqPsJpO6c6pLps4DrhSbwxu51i7PnOt
         wQqA==
X-Forwarded-Encrypted: i=1; AJvYcCX7I+B68Yvzqt7+wZq3wxAWrg8IPYIG5aCKcjSnPejRoCVdIgUVTE/T2Eq/7JLouIExtLfteQJATv6DAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl59JLrhIpxm6n6QFjFcKgj6qHn42ezXZ9f98b/HR9Ocz32XgG
	fljKKIh7oKpmsxP2Dao+JAMb0ekid1lYMA0cpe1fLNllddc8pieYrSudM47knJIQP6gm5vVpfxW
	wV1uKdde86Gx2TecBHNlSbR5aJ/o=
X-Gm-Gg: ASbGnctpKBgR6tg7ah5pg9GxwWsQ07P8M3v6bqixqq3CDghXYQuhJOqWvLEpNEfs88k
	m5HPe1HvH2+LSXOazLjuWsO/eo+XWc6U=
X-Google-Smtp-Source: AGHT+IF9w80ymL9NIEhURejFa82SLeJNTGDITpMHHMzFaSEyToD7nbmJEx/5xHyO/BxkrCQ6GTzUrBETxacbkqjx8zY=
X-Received: by 2002:a05:6902:1681:b0:e38:bcdf:c4ea with SMTP id
 3f1490d57ef6-e38f8b5435amr12294787276.28.1732549499689; Mon, 25 Nov 2024
 07:44:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 25 Nov 2024 15:44:49 +0000
Message-ID: <CAP-bSRbCo7=wfUBZ8H7c3Q-7XSG+SB=R4MHHNNGPvBoinsVSZg@mail.gmail.com>
Subject: [REGRESSION] ioprio performance hangs, bisected
To: hch@lst.de
Cc: LKML <linux-kernel@vger.kernel.org>, axboe@kernel.dk, bvanassche@acm.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The commit 6975c1a486a4 ("block: remove the ioprio field from struct
request") appears to have introduced a performance regression. Test
case is the script /etc/cron.daily/locate from package `locate` (which
is from findutils locate on Debian). The script runs:

  ionice -c 3 -p 3965
  nice -n 10 updatedb.findutils

This locate script will usually complete in about 1m20s on my machine.
But, following commit 6975c1a486a4, the script doesn't seem to
complete in a reasonable time (I waited 20 minutes). `top` shows that
no or little CPU time seems to be dedicated to the find process. Also
it seems that this affects other processes too - once find is in a
"hung" state, doing `ls -R` on the affected drive will also hang, even
though the priority of the terminal/bash/ls process hasn't changed,
and is supposedly independent of the locate/find script. I'm running
btrfs, on an external USB SSD drive.

#regzbot introduced: 6975c1a486a40446b5bc77a89d9c520f8296fd08
