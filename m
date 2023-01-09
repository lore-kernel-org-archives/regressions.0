Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404133D6
	for <regressions@lists.linux.dev>; Mon,  9 Jan 2023 16:18:23 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso10143747pjo.3
        for <regressions@lists.linux.dev>; Mon, 09 Jan 2023 08:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K3UcjBu6PVi7mK3hkSl6IFmijXju1CHofp0wsllI/uw=;
        b=Z7FCH8f1dD7WVkZ9GvRNLx5I0gMbUmt817sd+hlkKnCs9xPPbOUEn1H+mWljIt5KGb
         1A/6eT0BkGAyf6hnAwdaGs523yP56AP33o6FC9z36nsF3/QyTQQuwYIVpLQ4g5EMVM6T
         pUwkioHifwPNx4EYYqmC53faJW14a9UjVCEnv7oGhIbA8qx2/eXrfkoGAoxF+io6dhMH
         CPgnsCabsRgOjGIh498ER8b8LT/h5Cymq3slmwxcb8CBFrNzjtxg8VhiV/ouCql+Yr2+
         JTF7PbED4zd+yLtp8qRVcNn3OpZzy3c2Lq5KkhQUzKTpuUny2k+Y6jaf4Di9DXkrpZuB
         rMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3UcjBu6PVi7mK3hkSl6IFmijXju1CHofp0wsllI/uw=;
        b=dwA5Twwm7zLhB273SJXb3syvP3DJ5jD1ZbeZ5g+HkW58jIhT778vo4iXUT6ywZN1ng
         ZWb7N8w8DNSt3vLXxjMzG+YIsPOpOOL+vSd+UMNWovYW/w7CVeBl9Bpw3rqKIJesDwbc
         KZvzykVlqYQ4jvpqr9hoNq6BH3JwIC1lVyqk0Ltdhm+a0kmf+oa4u4fHfJE1f6NuEqTE
         WIPLlmRefQzL2R1hgp5iUe6Sa7xBth9U8GDh9cR9oqnKAvO0AfsFDIDAFKmvTY/VhPb/
         rF0wulYsOvsC2v5ZZyISKPdmoM+bXbh/lFv339zIVp7DJM47VESbXtTfJbi3TEVW+Fhq
         HfNA==
X-Gm-Message-State: AFqh2kprjvr8nYmsC0nRRpf2YTy27swcxQPd4Mbqhv9hheXD/s3pP49v
	uDk7SOCBDGMVlvvbohL06vbqv4bUz4fhPqtgUeg=
X-Google-Smtp-Source: AMrXdXvQzZEav5hU98ibbZi9Nu1kDzlWNNQPRqFdO0IDvT/5Lq8FmHfZOCWQdLj5/QQrws5WriY9LW+i+jL7QeBXOko=
X-Received: by 2002:a17:902:8ec2:b0:192:c014:f6b0 with SMTP id
 x2-20020a1709028ec200b00192c014f6b0mr2533307plo.75.1673281102855; Mon, 09 Jan
 2023 08:18:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Youssef Aly <youssefaswad@gmail.com>
Date: Mon, 9 Jan 2023 18:18:11 +0200
Message-ID: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
Subject: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Daniel Dadap <ddadap@nvidia.com>
Cc: regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello,

The backlight control has been broken on Dell G15 5515 since 6.1, it
is always at full brightness, this is only the case in hybrid (mux)
graphics mode.

As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
nvidia_wmi_ec_backlight    16384  0
video                  61440  5
nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
wmi                    36864  7
video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor

but it is not present in /sys/class/backlight, only amdgpu_bl1 is
present which is not functional
contents of /sys/class/backlight
total 0
lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/

this is the content on 6.0.12
total 0
lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/

Distro: Endeavour OS
Kernel: 6.1.4-arch1-1
GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01

#regzbot introduced v6.1..v6.1.4
