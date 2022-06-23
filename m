Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B481C2E
	for <regressions@lists.linux.dev>; Thu, 23 Jun 2022 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655978802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MioxYM3pNfOVLGO8cTNLJgT0cBlvjug91OSVJzVKM8E=;
	b=TFC9S9TP7H8obJw7894PfsbP0CSFn6HXzU4Q3eHcjaIINbMPW4KNtZHkBqbiw3WQ9Ou646
	TU9hqoI51UWgp132LpjnyiE1JIQYqDnFdneZCPWnNkFV6+tHbg7PFzAS/Pgyg38K1O6nA4
	6fn/FdAKylXqC5FYXTJDlF4xa+aGFTU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-eTBDsmghMxuZjmQxTIq0lg-1; Thu, 23 Jun 2022 06:06:41 -0400
X-MC-Unique: eTBDsmghMxuZjmQxTIq0lg-1
Received: by mail-ed1-f69.google.com with SMTP id h4-20020a056402280400b00435abcf8f2dso3568529ede.3
        for <regressions@lists.linux.dev>; Thu, 23 Jun 2022 03:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:from:subject:to:cc:content-transfer-encoding;
        bh=MioxYM3pNfOVLGO8cTNLJgT0cBlvjug91OSVJzVKM8E=;
        b=3sGxHb6wAVhkUaMGRA03z0DfnHf6xigNxZ8Nh+t4mOCx2NdrRHMU6bZerJQy//X31y
         +wmy3yjceKuEnlz26rU6WieqG/TjBRa5IQxKUQh0Ki/u7I5qcYuF9Q8KSo3ebKvWp0rg
         end4mv2ZikGjiyAdHvZBfKJ753HDMskRmGdnEgRP4xHp8OCulArMcwqDaR6Le+WOz7Xr
         /BrL8/2khYgRHRGJOSknDad67wOQT1NBbm1BmPFoaNNVeHHcDiXDBqGWh/nh3ymuR1hB
         hBKKI3O/nXJbR5WXee/j3MrAMEY8kgOY6soFkqo2SgV/r3bVuS6NQE+ZDenFWqsoAqJe
         +zzA==
X-Gm-Message-State: AJIora+YzJ8IaXPtBEdT9hFTvnJfG+QYcUOjwp8n7XKTDMyfyrkTwQOj
	tJdLVt2qDx3Z+HPpiey8GLOcx2yjzbnXm6SVfPAa4UB0k/zV42PH/4AljJciytltHRV4dAe55I4
	V+LNdWVJoET7isZSjahPpKcg=
X-Received: by 2002:a05:6402:100c:b0:42d:f407:b050 with SMTP id c12-20020a056402100c00b0042df407b050mr9274093edu.39.1655978800592;
        Thu, 23 Jun 2022 03:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v37TQT00xpGm9EZ6fLVsyBKDjYgnUbsIr3TY/LWilvcid/aWwNH4myyTsGzwkbjJ9htNpshg==
X-Received: by 2002:a05:6402:100c:b0:42d:f407:b050 with SMTP id c12-20020a056402100c00b0042df407b050mr9274071edu.39.1655978800405;
        Thu, 23 Jun 2022 03:06:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709060f0f00b006ff19354f9fsm10468108eji.215.2022.06.23.03.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 03:06:39 -0700 (PDT)
Message-ID: <6d7e3740-6107-dab6-64de-b4a978ae329d@redhat.com>
Date: Thu, 23 Jun 2022 12:06:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Hans de Goede <hdegoede@redhat.com>
Subject: "Revert "ACPI: Pass the same capabilities to the _OSC regardless of
 the query flag"" is causing regressions
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc: linux-acpi <linux-acpi@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "Thorsten Leemhuis (regressions address)" <regressions@leemhuis.info>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rafael, Mario,

Commit 2ca8e6285250 ("Revert "ACPI: Pass the same capabilities to the
_OSC regardless of the query flag"") is causing the issues fixed
by the reverted commit to show up again, see:

https://bugzilla.kernel.org/show_bug.cgi?id=213023
https://bugzilla.redhat.com/show_bug.cgi?id=1963717

both of which have comments from the reporters that
the error message is back again; and presumably also
that /sys/devices/system/cpu/cpu0/acpi_cppc is missing
again.

Can you please take a look and see if we can come up with
something which fixes both the re-surfaced issue, as well
as the issue which the revert tries to address ?

Regards,

Hans

