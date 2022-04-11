Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B31363
	for <regressions@lists.linux.dev>; Mon, 11 Apr 2022 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649667166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3vF22tUUU5mQz2MMbsVAqGRpsABBDO2J9NhzUkzJrNw=;
	b=Mmi3Rgtyp5gJ2FwpDlc8PZpCP/OKt4FyWBKcGpDGlpkHf9s7vfnnWvARj5L0Lpbj4bcIlL
	dCEQ5EMhk1u3sVVH7dRQhGVeeGHmNM4wGKr9ExBvm69zOh+KOaTxs9U9Kf5F8AxCbs+Ri0
	REs9Z844nQ/6Nwj1bTnZ9o8KNLI1M0U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-T2UptG2KOkyr4quX-Vg1cA-1; Mon, 11 Apr 2022 04:52:45 -0400
X-MC-Unique: T2UptG2KOkyr4quX-Vg1cA-1
Received: by mail-ed1-f72.google.com with SMTP id p14-20020a05640243ce00b0041cbccbe008so8580581edc.16
        for <regressions@lists.linux.dev>; Mon, 11 Apr 2022 01:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=3vF22tUUU5mQz2MMbsVAqGRpsABBDO2J9NhzUkzJrNw=;
        b=mb4hZmpF7Nns9yrLeFa4+Vpkf4rpG81ZAeV0WknNwNUpdn6XkLf5jG/3yJzNU09tDw
         Q82e50wBtWflULWKkTgbxct/7BrVAsw5MqTKqqTQ7igivxEsPqHGllhtpAJKng706pkm
         8E8qLBfmQ1SkRzXp/ZC07GM+VmrzpV8K90mGI7+rzP//5chCVYyYeEi01UmwmjXx+ucn
         aDzcitJTXmUWlhD1fNg7l7EKVuIwNd9ip13c9A0XGLGt7sJR95SCQ5pR9CBrPjaNkKiB
         PlG6eBXF1CoKMyTVxlGZYqAcjC0UmE3BKm+YMuzvK2majqnWlLrYSkDkSUU0FzgipGO/
         Zy5Q==
X-Gm-Message-State: AOAM5334IJpKQF8e+yUVMM/RFMbGnLnOzudV6lpSq0FdZdGBa7lco2xL
	bHAWMiZPmkfUf1uv34MoerdzTIPk3P6mUMbMAki+U6GnPy5O0kI/1hcokt4fMeVPfhk3Qxo2rBS
	F6b1CsNngvq75OJPlDGjhTq84FpThoFOn6TUZA/NnJWps+iFbbfDwKUqX0ZyN42oUgUG8ZfSxHd
	8=
X-Received: by 2002:aa7:d543:0:b0:416:13eb:6fec with SMTP id u3-20020aa7d543000000b0041613eb6fecmr32613456edr.348.1649667163887;
        Mon, 11 Apr 2022 01:52:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk6gMCM8hNzyJd6iz1CEcJcPZ6bA4l4Q1eoDTZQZEir4whNxpF03iCABMMNp4xK8HhmQnN8w==
X-Received: by 2002:aa7:d543:0:b0:416:13eb:6fec with SMTP id u3-20020aa7d543000000b0041613eb6fecmr32613436edr.348.1649667163483;
        Mon, 11 Apr 2022 01:52:43 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z21-20020a05640240d500b0041d7f66a9cesm1055757edb.41.2022.04.11.01.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 01:52:43 -0700 (PDT)
Message-ID: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
Date: Mon, 11 Apr 2022 10:52:42 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: regressions@lists.linux.dev,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: 5.18 vmwgfx seems to break booting VirtualBox VMs
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

Fedora has received a bug report here:

https://bugzilla.redhat.com/show_bug.cgi?id=2072556

That Fedora rawhide VMs no longer boot under the VirtualBox hypervisor
after the VM has been updated to a 5.18-rc# kernel.

Switching the emulated GPU from vmwaregfx to VirtualBoxSVGA fixes
this, so this seems to be a vmwgfx driver regression.

Note I've not investigated/reproduced this myself due to -ENOTIME.

Regards,

Hans

