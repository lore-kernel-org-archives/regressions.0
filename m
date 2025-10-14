Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23A30C355
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441158; cv=none; b=gt9/ziNdEjbumg15uxo1sVEHIErWIkZuRgvXQiPXEAKIPdsVxKLz5yEf5Fq9WyEB4RjmMQWfOY4AZqXnUxtBuabRWD4V9b0gqCB6H5kaRMu8RW8i0RYG/M2iz9DkUpytepyKpx8mdApPg2JxpiiLhALdNCJHfdb2z34TIOz9P/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441158; c=relaxed/simple;
	bh=iQmTbrHUexc232Nhf3QX3VZFHuse7k+IcjM2fAe1ig4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=us+UAVgkQWLmwUmX3ABCXfcSZKGlSKLlnD2mdACNeaqUbhGlbdCsYu6wShvjM3dHr7ZqjGxHXKNwBRY7UVusPREer1KgYYdvOZFEqZwQqOEVj+//WVPAqXcmkwv2QWrxV8tMpJ3IoxbL9tnL38/csRj/n/uKSvJa69qZpp6pqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwfIMGG3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwfIMGG3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-421851bca51so3444956f8f.1
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441155; x=1761045955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uiSHBqGlXIEAZvcjTP0Y/hDCrVSuK2ils+FnYn9ERgY=;
        b=NwfIMGG3KyhvL1IbWw9Ja6fhKoX26+Xn3x9/WObSR7ehK4ArIMbDMYui3a49I6Is77
         yVsbbfMggCiCV3jOVjmj9GzyeBTr2/2dYD0Lsh5+P/HHJYkw3BavlnpGnYp5dY3+IrLV
         0vDIcn6b8MR0DuCf/Jix/BY1Thbb5BlMiqVhrTIbA4bt6rPj+/4Jp1Zbua8OnALFS6SZ
         WWotxiLEoQFgPmjk/qoXYNPYq9lVUZUXuZUWGAouKlsXZHFkTKU/jNuptfKK2QSeEONF
         QHCFFH8FJOJd6Tp9sQ0knGTOsrx9CwuKNTD0jl3s9t68oQN7R6u7ZNbUIFjlkce98stB
         5yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441155; x=1761045955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiSHBqGlXIEAZvcjTP0Y/hDCrVSuK2ils+FnYn9ERgY=;
        b=LSVHUsH2J52i4H9g1xxHJGH6qjaQyllcG/6D2cp16CokPdw4rd1RnB0+uF6TxrWI2n
         lH7G5BH7YLYFAldM+8I89Uo1dZfSxDJ4Qj2uh6q9Am/i6Ytt+3lY9+t6hcUhjozU4ck+
         Q/LcEQr+4rZtKb6D4cv+YbuBB21+DJxPdZk2RqJ2PGoDXtPxndGqxWyGkX8D4I31IeWV
         f3G//0gnpQ2x3xJxXozUQov/VYUqU06RV7rXKi/bmTnyH0yTDB7q9xr24JnCbg7Vmf7m
         tSxeYjAUaD6tiqiF5fbKl4cyiVZsui36wjRv7++P96bzAgM2W6xknlTtkAVdwqtywdjK
         j/7w==
X-Forwarded-Encrypted: i=1; AJvYcCVYUI7cEmgoTo7pXBus9w8agw94ln4ZRinU8yo66ofjLQoIMllqkKlA0kvwfLVHeOt9DOazG5nexR1fHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4uHJzpiuxd8PPAibr7TpliHWc6h7s7gj9saupT1jm4Ghu+Oln
	TWDvsI8sjw/5F0IZuBSH56uZRGIjrvlynQBXpk6prpHtQosjcSbHRuNZ
X-Gm-Gg: ASbGncv1N+/vwZm7GUgwupnOmfdCaL/NdeldI8X0yRWaKa8aZb65O4UO6747f/3Qur0
	LLRSRh7SMksnBJjg+7LNxP+YT8zOebEciQNRzR38y3faDxYc7rOo44BBFd+CFibNcerDAGX1cWf
	oKh61xxq9Pzmf5LwBBd4qy4Suc2RKLi9TaI5zGccy0KY+UJkbM89qgOx8sifAWPWvJq+SmhZ91t
	qxlmc/uIccbZ8BZmM+EUilov9a7YpxhclpOySR06VMtiwaBE/jCx6I8lKWioNq+v65AtYxc8Kcu
	165A8iZxmUy1AKs6F31jB8E5koCk2bEiQu/u2p8kJ2zz5c5c0BlX9utA3fVXJHKA2vyIxnJKdNH
	FPY8SeulJGUDlT9wzBfVarTnQI+FzwvKFBg4XWZErIJRpqZyBS56X9l21Ozd/pdqFC+HUa8YQXA
	yPvH3+aS+Ch30AmafZ8gsPWqN2ZE5fz48Ie6C2Uo5F13U+r8ODfrs=
X-Google-Smtp-Source: AGHT+IEqaf50xViFqcGYgiRoMt4dwJ2xrUn7bmjBXs3Kk/pC18UdQvc3UcQNURWNwY1ZJ/f0754E/Q==
X-Received: by 2002:a05:6000:3111:b0:3ce:9872:fd3 with SMTP id ffacd0b85a97d-4266e7d92eemr13663773f8f.34.1760441154531;
        Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1024sm23047515f8f.42.2025.10.14.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:25:53 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, regressions@lists.linux.dev
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
 <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>

Hi Luca,

Thanks for your fast reply and all your work here.

On Tue, Oct 14, 2025 at 12:31:35PM +0200, Luca Ceresoli wrote:
> Let me have a look at the DRM_IMX driver, I'll try to send a series
> converting it to the new API within today.

I will gladly test, thanks!

> I recently sent a series proposing to make drm_bridge_add() mandatory
> before drm_bridge_attach() in the docs and warn if that is violated [1]. If
> you apply patch 4 of that series you should see the warning.

I gave it a quick try and did not see the warning. Some printk debugging
told me that `list_empty(&bridge->list)`, inside drm_bridge_attach, is
returning 0. 

> > However, later on, another regression seems to be introduced by
> > commit 8fa5909400f3 ("drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()")
> > so reverting 94d50c1a2ca3 on top of drm-misc-next does not solve
> > everything. This was tested by rebasing drm-misc-next onto (260f6f4fda93
> > plus the revert of 94d50c1a2ca3) and then bisecting.
> >
> > So in v6.18-rc1, both regressions are present.
> >
> > There, I get the following additional warnings:
> >
> > [    9.732278] ------------[ cut here ]------------
> > [    9.732336] WARNING: CPU: 0 PID: 38 at lib/refcount.c:22 drm_bridge_get+0x10/0x18
> > [    9.744608] refcount_t: saturated; leaking memory.
> 
> Not sure here, but it may well be another symptom of the same bug: the
> refcount was not initialized correctly, so it is found inconsistent later
> when trying to increase it. Let's fix the known issue and then we'll see.

Makes sense to me.

Kind regards,
Ernest
