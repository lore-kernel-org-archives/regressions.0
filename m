Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B113D503
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468784; cv=pass; b=k2KxMmbXvWDlxTi2zBo/7jE8vXyRww+jQrDqBKxsD3tLkAzaMavh5XKoX2ClIiVCEt3CBBsxC61n1YYUabbCNktxmhxojgYM8CKxSb6Chekc2qna9l5D+8b/lyhAat4M1S6fFvpABK7FJnyhlmS+MbqhHwujjGkMANh7FdMf8Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468784; c=relaxed/simple;
	bh=qUzJ2BMhk2qoIHxwUszMJ2chiqeRX6VobF8MF0524HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utw7kTTlvXMJNMHw+xJZncy8O6jaITbKN2fqqFjMuTWx7nE21Wnl/wDyIaTL5Q1h9Hb2X6ppqi7FID5Z6IqVoG+B5w4rKk7jI1MUQqQsq7I6V080aBZPxwrKzktBx2Eqn5YP0BuiGBdkdJalPzLxfcyzyb87EC/dct8xuAT6hYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rv/oP9pF; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rv/oP9pF"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d836552daso230111cf.0
        for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776468781; cv=none;
        d=google.com; s=arc-20240605;
        b=F+LBwSmWN+QpRTS2ihRBYbZcKCDHEc7vYVOzzR4Pg9HbUiDAtUAf0Bjmwth00QKxof
         avXNfo+1OagKgttQ4Jr+Jv78U4avVNaTl04LLNfWf1IKgGf7uKqRpMvUt/ZvxjpBSzBJ
         pqM7BmCRlFoM5KzHBtspspREVFXs8mofruJWru3AyPA+BzUJCYZ862A8JXHkm3EzSeLP
         EGpg+1QikawgwH76TB1iigSl5tde8BOxQeCWmFPTOGC30Vz3uQ0DwE2jaSk+pjj4daiA
         oUU7MCdZJE79pEpscNpHh44drwcZ6H/X3XZea+/JoHbeMdVMJbSeyFyKmNhiUASVxRi9
         8bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUzJ2BMhk2qoIHxwUszMJ2chiqeRX6VobF8MF0524HA=;
        fh=LoRQnxbO04A8wKLTT0hEYqk7fYQlnpt0/J1Ry45ITG0=;
        b=WNadnaqLsn994dMBlrWuwHvvcDC8XCsQDQwf1AZnBlMaxS4a+zzQg0TDrfzTZ7P+Ga
         VwOz3/XuYpASDyi32L91BbM6icAKZTbUxHxia6VF+MaNV2eCL2mVVNVEy8Rw4ysygqa3
         MbDLYwoH5BPW/g8YKOgs34aJtJNEngBYwwOGdLvfqVzFmk1IbgSQZMkmgM5TrsZU6M+e
         9fp3N9ZVajqrlEKajGGI0AuuLL32h3qn2pNK9Wey//JGXnnmj+aNN4mXdHs+T+BXn2QF
         5GEZZvDm9XLCPEstN/AWYpTxCuLtkpX8rIS35Lk22JzWD3CvRCAH/eafBT/ZuQPtfaQC
         bvnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776468781; x=1777073581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUzJ2BMhk2qoIHxwUszMJ2chiqeRX6VobF8MF0524HA=;
        b=rv/oP9pFPHTAabw10S1JKUrT361cCtGbwWMVsEMy+b/3nnBotdw8XCWrxZ7AJZEPl2
         5mTnDxOqPGdjqUlTquDBOXxg5yNUpzLtzbdK9f8KBpBaOg1//VSDuM4Er64KHkY3E22g
         5iFwo4OEStsheDKOQUC/yjNmK3HgsOyclZEeai2eidlErKUfKD1tYxzbjq3RZ+RJDxBy
         jEu4NzvxZPVdShEzpnz3wDruWE6A7poB2+L2Ba9vKhdcXVS0kPs1TbaDCpVJrcf5QiBn
         uSJh+cX6az7ZWb1r+LLXyWo9PfwV3PjxwP67lWnBt+Qol+vr1FXalaFPA4HpvdXiiKdL
         eYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468781; x=1777073581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qUzJ2BMhk2qoIHxwUszMJ2chiqeRX6VobF8MF0524HA=;
        b=fq8+LCzLWkLdz++hZqj5ge2f2CL1OLcSq3jsYa2d4A4b9jxfsp9vWRiG/DdaXkKfEl
         uB0LKRpUQo+EWPXd/G/bLLnFA/RUyOZxkPh9BuOkKoMhLrtLElJau4AQ98bt4A6IBn3q
         tTHU/AeXHIC/GaXW5CuJS1bMVRzTOSuJmNgQRA3Q0eFucMnLgqX/MYeX6CPhX3jgEUmt
         l+ANGZPVsKOviJT9h8LcRmB/ZCwgfQnU7C0zT/Z66xba5ue2TD/zfopImkqqMbKEXljy
         Z5JSeBqPm9QwkZn9GBWQJhPSiUtE4DorDAUZUppSBd/FQiRqx/4hQPzpcCiMkxhlfFb6
         jCfg==
X-Forwarded-Encrypted: i=1; AFNElJ+qHfzSOAJuS1iNShDcKv7tRdPHLGuKoGKPDcQg9pOawYNRoRjbgqIXywnFtDkn/1YzSUCrxjF0RP3McQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpfhDWPAZnSV5+MEdMfS+t11yAlfIUHlaOVvZnk7qSDcqxnaE2
	UErtzltVW1vlPnpt/j00HgtqGIF2N2XRtP37Xbf3wR7A3Mm7LlbVMUFJeMhZai82imiYuw5CN9V
	0QDVBP1JI3HDAhVCYBfQARek6+/Zs5VZCKsfa307J
X-Gm-Gg: AeBDiev2bNc7k6fnGOJAzqPBdzuZ8VcL2r2dq25DFMOGLeRw/McqEMutBwHBZEjj2yc
	RrEgWUi1yzOuprpiYtpOD3TdFcBa2H4Ox/Lt2o/5Cv9heQ+NCrxUEay3a83HfAQXhkWwi6m47nB
	8D9kYzeC9Lnh7SPEomeO1+TLB89fK5DcS1k/2T5+OrfDOkuueYcmT+d6oSnyQchw2QnMUecrpg8
	p0fhEYmWl9S1KsRmWPDfu/6TzyDuQAQ5h1Xqd+qJneEERSXgh5dGD1nkpRXD7VXZEeVfOYwya8D
	egi3wfwFI+8cU5c9OO9+6ny9i4c1beH3CsCgPW8=
X-Received: by 2002:a05:622a:989:b0:50d:637c:cb64 with SMTP id
 d75a77b69052e-50e42a0876bmr5956351cf.6.1776468780182; Fri, 17 Apr 2026
 16:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
In-Reply-To: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
From: Chenglong Tang <chenglongtang@google.com>
Date: Fri, 17 Apr 2026 16:32:49 -0700
X-Gm-Features: AQROBzCRDoRoqlmFhgpm5PRxW9yTaV4weYU3Obvq1Py8PtiWbd_glLtwlJLTctM
Message-ID: <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com>
Subject: Re: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: Derek Taylor <ddtaylor@google.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Kevin Berry <kpberry@google.com>, Amir Goldstein <amir73il@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC Amir,

For example, containerd 2.2.0 uses `volatile` instead of `fsync=3Dvolatile`=
:
https://github.com/containerd/containerd/blob/main/core/mount/temp.go#L91C1=
-L92C1

On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Derek Taylor <ddtaylor@google.com> =
wrote:
>
> This change seems to have so far affected at least containerd in an
> issue reported here
> https://github.com/containerd/containerd/issues/13250.
>
> In stable versions 6.12.80+, commit
> 6c0cfbe020c0fcd2a544fcd2931fbc366ee3cd12 with the specific change
> being:
> [*] The mount option "volatile" is an alias to "fsync=3Dvolatile".
> In this scenario, code relying on checking "volatile" will now fail
> due to the return being "fsync=3Dvolatile".
>
> #regzbot introduced:v6.12.80
