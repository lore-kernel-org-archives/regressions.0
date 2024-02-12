Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B03C092
	for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707751695; cv=none; b=Cnn6ahGQMb0N4mytJTfUb3izTtrecn+xRrfP8Y0w1H5uk5yTCfiLfHFn2+yTcMECh8ebjRlh4Cwemr4dpSdFqN3elo7vGEEUh/45aT3ZFrO+JkbtT2O+XxIrHkuDro6u7YFYdUG16+WR74hnFTYDxyrKkv7P/2FYOIIN2j91fws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707751695; c=relaxed/simple;
	bh=+Uesfua+CvJPDWq17ArzMv4ITuUC1A14TVjd7UU+nrs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iWe3S5cvOyYCHAsO7gepUIWEhSfLAqE3R9D2rSkS7uT3v/kJCgRfto0zNtdk5QCQ2A7y8ViFV+AK/XmNsWB6uNVXLNFU6rCz9kqCBkEok5bsB133Csui341iCisChYwcVPPsQeddbfR/I0jw7DVowuBtVhP73yMTcArS36nJmRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGOwe84u; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGOwe84u"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e09493eb8eso1885112b3a.1
        for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707751693; x=1708356493; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wVQqSLmG6k2OkxB3p97oV/K3kbotGud22eLraa0EYmk=;
        b=LGOwe84uWbXMvZ0tG8LtErxOdHNau4fC0ohGZ0ZrXHQw73Rty1J0jnQs4CN0ZZbUAP
         VdDf7aBmdsVn4fFx3ICirZuP1CMft0n64jZz1BdkL8CWLWTxQ3zhmMcOmtg1rzUm0s0Y
         2raQnrlaofxNe4a2CCp3Fq6bp3eLCuk990yuhsW6jGQ6JDDd8oLm6K+aZ4zSXEj4LWJi
         kVSjIVaWsC5K2IpeowaHuE7wR8mawPgov6VNhGzW+JbReJCtuGaSzhhwwMcPq+QTVJ17
         v8fnyh4gT9NY+0NEF3oCIc+T7MKkoQKOgJ8My6uRl6+QN54bUKQ8jr2sNDtbsZmP7thf
         mRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707751693; x=1708356493;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVQqSLmG6k2OkxB3p97oV/K3kbotGud22eLraa0EYmk=;
        b=ujG8oXGfN6scmOq9HV8Y/vvBDT1MHzqCzOcicbt0bzpdcrHkn0Y33N557A1pul/beK
         3YnRqcCJSrzdS5vmUg184Gahr83nWY7H5vYjizqSQGGLT0fghi/D0Ry8nL2bBNl8zYXv
         cvdgM+9d/JO3BJd1dFykJG5lGR8bjf7boe21+SRa/bGFQeBE7KX1rTm9jR288AgeApJJ
         nMoPNP/5YqRDMXsBD2uT9ZVfGwpfe5ryV4KrOwTIGIgegIBI+RDbwnRJQgWmyzOwBF6q
         zGYQgk5rdESiTPA7mBiY3bYXxwUUxRP4gVrhO08/m/TV/l3bj1hZQCi+QwxG/miIqp48
         AC9A==
X-Gm-Message-State: AOJu0YwbRJklk/fR56NeyD5w7O4BU9/o6VXu68Hd3TTJTJgccn5o8urc
	TfKiXnDVPf6bQZnM/hoCqauof8gCCx37wbJfe72RStSVVJ3Sp7/tn4GBrjQvZnuyq9z3BZ10ahq
	GKjRAvDI0yPBDGPz8zTdDT6Qz1LSKAVv88Es=
X-Google-Smtp-Source: AGHT+IGjCcUB9s7vN4LY7VVmdgp0VYcLtZ+6VXRAyZJTcrgcfOP4hBoTCUF3kXOunAufL7lewgzCoKW3TAZW7GZj0t8=
X-Received: by 2002:a05:6a20:9d91:b0:19e:b614:685c with SMTP id
 mu17-20020a056a209d9100b0019eb614685cmr8696283pzb.22.1707751693250; Mon, 12
 Feb 2024 07:28:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Leo M <lmartinho03l@gmail.com>
Date: Mon, 12 Feb 2024 16:28:02 +0100
Message-ID: <CAJbWX8JREQs7wFtFOfkhXTNhP1wPg2qTUQAJVnUMDkMDFmNBFg@mail.gmail.com>
Subject: af_iucv kernel module fails to load on bootup / manual start via modprobe
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

* update to 5.10.197 included upstream changes from 6.x kernel.
* in particular this:
  * https://lore.kernel.org/all/20230917191101.257176910@linuxfoundation.org/
  * this isn't an issue with the upstream state in the 6.x kernel as
the problems this change might cause are alleviated by this commit
that altered the way the iucv_if symbol was loaded:
     * https://github.com/torvalds/linux/commit/4eb9eda6ba64114d98827e2870e024d5ab7cd35b

In the current state the symbol is not loaded correctly and the
feature is not working properly.

This issue hasn't been resolved still and is in a broken state up to
the current 5.10.x version. Is it possible to include this fix in the
next 5.10.x version?

Sincerely,
Leonardo Martinho
