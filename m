Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE8D366
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 00:25:53 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57b5ef5b947so4358732eaf.0
        for <regressions@lists.linux.dev>; Mon, 25 Sep 2023 17:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695687953; x=1696292753; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EndygcAAjSZYYYSGW2g5PCBC6k5ixtfB9rULOZ8VgLY=;
        b=Ee+qqvjK6EXkGWkBfUM8ilvWbHJwUlaVxiLxbT3TES6m5bfzTFnwYpKGtixPqEN4lN
         f1cL3frXqSome8HL3IOiDhMRGqbJrl4qtpRqNAJWdtIHlYqgtcQ9q/7mn5KbjP5z0Yo1
         d/qlbTmMnk2QDZ/c1R6IpI7/2cJlKyGz9sEsNRH7F473Mqxl2maXZ/RzNlDR45h/Ak7C
         3fqQBM5uPa6jZdCir1m1C90KVifnHRWT8MIgGlcOChHhBOfsAvo01HhGondbRoYlAFMs
         TXAlhD1crzxEnNLdNFY82wTvvtFgKjyd6cBj4QbUvl/cDAdQHYbZehQbDl9fFhlC5B0R
         Ta7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695687953; x=1696292753;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EndygcAAjSZYYYSGW2g5PCBC6k5ixtfB9rULOZ8VgLY=;
        b=nZUyu8MMIm1hEQ2+CZdWZqLpjZd1MeAMmivpGDSID/TJgm4PVXUsEMrR9uAcp6Sofy
         tyt8cOY0GhqMaH6QMtg/2qKXwmZAzcCjQ88UCo7pD3I0TFyGS8ALjsEbeNmVImiimgj9
         tD3zutu+VlC8j47Cljva3nw+hL0KRNVEg45F3UUVcvtyA3Mk5Jjpr9nSOuo+9gZMHDhd
         qM9o1aMAEhHUCJl5vR1z4Yj+n4VzDS2OdeTXBenQMREAUe1gqhm24EmdoMqs5Ic0x2r1
         DkoK7KZTTizfWHUKewCLBHhJIUrPXK/4DlfLhpeNJj0k5juvJzQZsgNqce5BYV96cmk6
         sdnA==
X-Gm-Message-State: AOJu0Yx0aiuqjWKtkpriJuEQD/4/Mbvt5lxM0Fwu57th23lK5PexscZG
	lmISoNpexsKkKAoWi7fMQGA=
X-Google-Smtp-Source: AGHT+IFUYS4ZMeYL56nT74mymxtirDqVejiQuiN557RGluOT00M4N6c1CrcZFlgn1AFRaKhTJPIqdg==
X-Received: by 2002:a05:6358:7206:b0:13e:b54f:5c18 with SMTP id h6-20020a056358720600b0013eb54f5c18mr10380687rwa.17.1695687952857;
        Mon, 25 Sep 2023 17:25:52 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id r9-20020a63a009000000b0057e13ed796esm5633870pge.60.2023.09.25.17.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 17:25:52 -0700 (PDT)
Message-ID: <585dcc9e-7e72-473a-98ec-4f06018d542f@gmail.com>
Date: Tue, 26 Sep 2023 07:25:48 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux ACPI <linux-acpi@vger.kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Arnas <arnasz616@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: [Regression] S3 Sleep Mode failures since Linux 6.x on Dell
 Inspiron 15 5593
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I'm having some weird issues with sleep mode on any 6.x Linux kernel version - it's a toss-up when I close the lid as to whether it will sleep properly or not - when it fails, the screen will lock, but it will not actually enter S3 sleep - it just blanks the screen, but the laptop stays on (and fan does too).
> 
> Opening the lid after a failed sleep attempt turns on the screen instantaneously, and it doesn't even need to reconnect to WiFi - this doesn't happen when actually resuming from sleep, it takes a couple seconds for the screen to come on, and it then needs to reconnect the network.
> 
> Following the failed attempt to enter sleep mode (closing the lid), the following entries appear in the system log -
> 
> arkiron kernel: ACPI Error: Thread 3233415168 cannot release Mutex [ECMX] acquired by thread 3268191936 (20221020/exmutex-378)
> arkiron kernel: ACPI Error: Aborting method \_SB.PCI0.LPCB.ECDV._Q66 due to previous error (AE_AML_NOT_OWNER) (20221020/psparse-529)
> arkiron kernel: Non-boot CPUs are not disabled
> 
> Now, the "Non-boot CPUs are not disabled" line stands out the most to me here, because successful sleep attempts won't have this line in the log.
> 
> After the failed attempt above to sleep, I now close the lid again, and it seemingly goes to sleep successfully. After checking the log following this, I find two new error lines in the log -
> 
> arkiron kernel: ACPI Error: Thread 3233415168 cannot release Mutex [ECMX] acquired by thread 3268191936 (20221020/exmutex-378)
> arkiron kernel: ACPI Error: Aborting method \_SB.PCI0.LPCB.ECDV._Q66 due to previous error (AE_AML_NOT_OWNER) (20221020/psparse-529)
> 
> Note that this time the CPU line is missing, as expected for a successful sleep attempt.
> 
> This happens on both latest stable Linux kernel 6.5 as well as the latest Linux LTS 6.1 kernel. The last kernel that this didn't happen on was Linux LTS 5.15 (any version), which is what I was running up until the Linux LTS 6.1 upgrade. At that point I tried switching back to mainline (6.5) to see if it would fix sleep issues, but it didn't help. Downgrading to Linux LTS 5.15 did fix the sleep issues and the laptop seems to sleep reliably now. Running LTS 5.15.131-1 without issue as I am making this report.
> 
> I'm on a Dell Inspiron 15 5593 using BIOS ver 1.27.0 (latest as of now), running Arch Linux x86_64

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v5.15..v6.1 https://bugzilla.kernel.org/show_bug.cgi?id=217950

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217950

-- 
An old man doll... just what I always wanted! - Clara
