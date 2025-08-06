Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D480727146F
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474223; cv=none; b=eoXV45sT3pApLv1txLAynjb+FPqWQ8S+v2jzHINAmw9ifq/Pkk0Xo+VHMX+8CRJdd0QOo71ndPveZJmdAgHqidg0UOx6FGvi0I3mwopt+Mxbw9njBMarugdiYUw/fmWnKG4LKvckh8Ve31fWpSXsb1iuWUH5v3dQxuE+rJo/1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474223; c=relaxed/simple;
	bh=UnRhCBGz/g5M0sDRDevsbQoDZqubHqeSfzdgXcUdUSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F34jTshX5FV7Lr6B8qsWJlUuKr5qzXoLFRAOOKgwn3qRDDvLuP792DBF7yCwR8Z6vojy2XXRA4GlUUC9rFhK9wImcLKl+s1ZP4EeTTrVmtUgfhyEBR6bG25Sy9ojvzBUL6QqV7AKsHzj3E3irSviX9jn7DqRTb2v0Dal7xzafW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tnq8VmOQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tnq8VmOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754474220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UnRhCBGz/g5M0sDRDevsbQoDZqubHqeSfzdgXcUdUSU=;
	b=Tnq8VmOQse3Q/kJJOWRiG4ErN2naj+oPJqQfjzEDSrVe7pLZv/u7K2RLDHtKPjeo9k/1wt
	jUjKLoDwTvlhkOknD1dQHkD0q+6KTh0RyC+I6CuUcGj/vsGpfI3cXhvwvBbn5r8jl2381s
	l2rvWTsDlY16fW61qg9fuZCqMhKJRt8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-HPbkQDwEN2edb53kEpFKow-1; Wed, 06 Aug 2025 05:56:59 -0400
X-MC-Unique: HPbkQDwEN2edb53kEpFKow-1
X-Mimecast-MFC-AGG-ID: HPbkQDwEN2edb53kEpFKow_1754474218
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b785aee904so2883439f8f.2
        for <regressions@lists.linux.dev>; Wed, 06 Aug 2025 02:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474218; x=1755079018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnRhCBGz/g5M0sDRDevsbQoDZqubHqeSfzdgXcUdUSU=;
        b=msub6oO0gr2Yv+ZWRhZZhPzCzK6RLOi7pOzIgHJNK8koTXF3BjU0K2NfRisvzLYaJS
         hupdfQk8/zs3hJNSBaYLW/sct/CbGPurtAv3qBeSAZi3Zsc/mSTWi3YNYhJx+cAoJAFG
         EyJy9nuzbm5m1O4U0My6pwLd/Lqm5uf5wV/iqSxcBopt9oHjOHgiRq2Ixe+7mCcpBG8O
         65Sy8TGRKa0uhvZl6sgIGgL7Wy+egb3DrYqogFA52jhGI5WvlInRlJzfwjev6PwflaEC
         s5u837A7IBCIYnonfYJjENK3ezs3n/SwBXCVNNZqqkMgFTMJxGA6MbmXqS5/J8g/5T1l
         pB3Q==
X-Gm-Message-State: AOJu0YwvP7axPgOWFskUCpbz5CGuWqROAwX4V6zquZi0iCctWrjgpjVT
	jnghn+NnDS8tKo/roTjFK5UJDaJRaXsMPEkkYPbXd+umTTIcJDV0j/6t3cbDwIrxqoQxOgVIETh
	/o1wofVfx8MWDpTwBZ+hzi7n/3J2ruienzPy4Y/ZV+o25b1bjCP174HU00pbOJCjrp0jj/thEc2
	79I2Io6jqw5p65MJZgINVXBzE13dp1xPDtuVWGhxg=
X-Gm-Gg: ASbGncu41TKQnLUl+iGIhk3pP2WN7JR5wkt1bQYfRKfIkjkjwfkIri9iQJ3gesEhJD2
	0wLGfDyudW0TcMQrv/5foNlv3FvHZbEKz05kf7sW4WlOBESIenBN+nV5wuvCmSPgaSx6LMDLB2j
	B+F16rv9sklP5r+HxCWKlGyQ==
X-Received: by 2002:a5d:5849:0:b0:3b7:92ec:68ec with SMTP id ffacd0b85a97d-3b8f41bb8c4mr1730018f8f.14.1754474218385;
        Wed, 06 Aug 2025 02:56:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmkIlZiBIO0pxwuhv5ZEuhlp3NbgCJIQMCznSJgwMIdEJJHMlTE317CHbrVdWmT1WXyuHGPX1pWe6egu5BZuE=
X-Received: by 2002:a5d:5849:0:b0:3b7:92ec:68ec with SMTP id
 ffacd0b85a97d-3b8f41bb8c4mr1729994f8f.14.1754474217980; Wed, 06 Aug 2025
 02:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com> <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com> <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
 <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com> <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
In-Reply-To: <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Aug 2025 11:56:45 +0200
X-Gm-Features: Ac12FXxUD7IfHIB3LF4bE0A3e_MF7VVLU9X5HEvxDOG2SUB9XsZW8ohxIfMVMqA
Message-ID: <CABgObfZagg8_w100tEnbU0_adUWPcnQYzxy8aAyUqVASjxWujQ@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: Andy Mindful <andy.mindful@gmail.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
	rafael@kernel.org, ville.syrjala@linux.intel.com, tglx@linutronix.de, 
	Christian Brauner <brauner@kernel.org>, Jani Nikula <jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rdImVVLE4mGcvrQ6dZbzthPgMwktSXmur-ZRQ76Sihc_1754474218
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 10:40=E2=80=AFAM Andy Mindful <andy.mindful@gmail.co=
m> wrote:
>
> Hello,
>
> Can somebody advise how to properly bisect issues in linux-stable
> repository between v6.7.11 to v6.8-rc1 tags?

If you can test 6.7 and bisect between 6.7 and 6.8-rc1 that would be
the easiest.

Paolo

