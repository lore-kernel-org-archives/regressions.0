Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F81DDA3B
	for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743111400; cv=none; b=cVSTMj6wQ4+Tp/WBYYWb67zKuJEvyNfNFCsfyIKHfrrbipSL64qMlgXJQkdFa0/WXSXtN6DtW6Jso0io1T+woCNCn+KCCUfug2JFjo5JFrVaZ+ZhOpUiLiJegkugVGh4CWjATs3ULFgPKZ9xyljPUD9SwfJOuNRc2fT5DIrSDjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743111400; c=relaxed/simple;
	bh=B4RusQme468Z14003zakyKd9kbWDDFzxtd6wF0JXIfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hga17DpoNXVtfKoz4SN2Nlreyn6kyKZqpqbyV5zjnDft0aojaS6+3vO+8zBzKBWsGO4HoU9ugJQaq8kelD23ESp9Qi4LgSppXN0/o8MJXCxJGTUM3SlRFPdbVEKlpNIczl8ARwDFHgKpcSlWHmJ/XqpUB5NSCcJagSjhQfxzUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIXOTo9M; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIXOTo9M"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-700b17551cdso15593167b3.0
        for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743111397; x=1743716197; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B4RusQme468Z14003zakyKd9kbWDDFzxtd6wF0JXIfY=;
        b=cIXOTo9MsvUG7dNRexpNm/Yi/B1DFGiS/w0CF6lVhvoYIcZHVPfJDgVdIm0V3R6QHo
         PWirDNs6/9GRQKo3J/D7pbt9IBKs3I4VG/HDqzmVMV+Udk+DPFIk12tj9sd8FKxZCmBa
         OqV4R7m7rLUI7DtcTQDJVN9jhjxwVTVqx37ufY0xoUo0tZxuqq5LUMeCpGtYEXQRLQ3p
         lhChhlTbNaEoEJG0ywsdWZs5XY9JaF+a6DDpmyUq4vHHdoBtrYpHxVHgqqsEl+CFAURu
         gsuwoTpU+S5qA+sJftGiURxvNXw4D/6ZDO2RN3rDMFtBmRXDrWSKEZsDCUTHVsV6BXio
         Heew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743111397; x=1743716197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4RusQme468Z14003zakyKd9kbWDDFzxtd6wF0JXIfY=;
        b=ERL6g4n9ZRKR32lYSaRZc2GK24/skpq6FAvvxQwunpWJECxlM43ia+3RPKUuraPsxu
         MNwyUh5EmMlOLQM59FK3V2TLyrHlLdXNcQpXHW/VC7fY2JoJ+wOrmw57RPjRHimGkGo0
         0eVWRPP5MjoBDNNjG2wyQP72fuSjcTKUUgDB3yHr18zRWAdkxCAf+lXhOKpnheta2ZIE
         MZVFTNUnF0elWCIENW6due1+ogmHyS/xB/wyTWebRbqcpt7Namf1rrxRZbm576oCSfRr
         1KZP0dmys6Sv9BFnOOrFfSm9h/lmJotv0c64EYUtUYYn5kKwuvnI18HgrSFlKxha97vv
         vYJg==
X-Forwarded-Encrypted: i=1; AJvYcCXkUzcL5SU3n5ywuEquJft45XY+lfHCppvXfUmVSUwRiFNy7qDmNB6UT3bUN7xYawoSnkqxwW7Z15n+FQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDh8zhr5HVal6YFQGDZ/9Z7Q3SWqM2NUmS9SZHaHiDF9RiKkhj
	6cXKcGvP9xW3npAQcGyn5+9r+ZKKnAPf+H608/NuXEv4qOTdmHgVg0A/Ly6xV2gP/UbPEouB3ka
	v1UMmUQYbaVA3sG7kznQoLTdIlbY=
X-Gm-Gg: ASbGncuc/5DEgLmGgVfVyT/BPMtCOeO1lAAlTEa5jTJETpell5zYNNQ+G0MXM0OR9vk
	rgOEXN5r09W2H9mHrCefJVMP1MySZ3N/hc0EREGJLoHPinObKJoOtfbES3RJnXdTyG3csf8E0xy
	ReOHKC+V72I5Xc/eeyR50/r6ci2TBDCx60oM8zrjle+MDMvTqMd6DL3iQ41Vs=
X-Google-Smtp-Source: AGHT+IGCmN7dI873IFGJjc15EYQLKaNHIe58obkdCOf2gNVCBKeqKVWfvkjj5P8PoluwzVLADbZP6+bn+4tkzWS+DFM=
X-Received: by 2002:a05:690c:6906:b0:6fe:e76a:53d9 with SMTP id
 00721157ae682-702250bfaedmr69236627b3.28.1743111397296; Thu, 27 Mar 2025
 14:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbMbZe9LCE15SCbYNTGZjE_xiAm29qzO_WNVjHsJ6oyyg@mail.gmail.com>
 <9ada34661b93fa5dfe3b0c66816a62c1a27f22a3.camel@intel.com>
 <CAP-bSRZm4CyxY1VdtWvZRcfLMwc3njd3OTSd446Q5dcSfjJY=Q@mail.gmail.com>
 <CAP-bSRbon4O=DCLHvOZHm452Svc3-gsZ133Jn7-TFt8f_Y1CFA@mail.gmail.com>
 <36b0f88ff0f17e0246037d5f834ac545afa69cf0.camel@intel.com>
 <CAP-bSRb_f1A=_+A9x8J75socYsKFKDtysZ-m0+6Ks7NdSjQ0-Q@mail.gmail.com>
 <b2674ab2706c2ed81734f2c3d6261511414186bc.camel@intel.com>
 <Z-SdYIm_lDvmCcO-@debian.local> <2a8fe208aaae404a724dcd9844afc2182c1ebf45.camel@intel.com>
 <43c0e4554151e015c068b79b5da7231f8674a474.camel@intel.com>
In-Reply-To: <43c0e4554151e015c068b79b5da7231f8674a474.camel@intel.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Thu, 27 Mar 2025 21:36:26 +0000
X-Gm-Features: AQ5f1JrxO-Dg4MvK-4svkStoDaI_k7xrDJyGbOntIVmSxwUU1jxIl7-VPzF4HhU
Message-ID: <CAP-bSRb+qO-FhtjrGThCy2OoXU-jb3rkzzyUUkk4vP_P-u53Cg@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi resume error, bisected
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 27 Mar 2025 at 20:31, Grumbach, Emmanuel
<emmanuel.grumbach@intel.com> wrote:
> And here is a new version of the patch.

The patch didn't apply cleanly to v6.14 or mainline master (presumably
it was made from some other repo?), but as it was small I manually
merged the changes. Assuming I did it all correctly, then it looks
good to me. I suspended several times, on resume there was no error
and wifi was still functional.
